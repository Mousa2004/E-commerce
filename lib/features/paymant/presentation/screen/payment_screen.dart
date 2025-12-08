import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:ecommerce/core/widgets/custom_text_field.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart_product.dart';
import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/request/item_order_id.dart';
import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/request/order_id_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/request/billing_data.dart';
import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/request/request_token_paymant_request.dart';
import 'package:ecommerce/features/paymant/presentation/cubit/payment_cubit.dart';
import 'package:ecommerce/features/paymant/presentation/cubit/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    PaymentCubit.fNameController = TextEditingController();
    PaymentCubit.lNameController = TextEditingController();
    PaymentCubit.emailController = TextEditingController();
    PaymentCubit.phoneController = TextEditingController();
    PaymentCubit.cityController = TextEditingController();
    PaymentCubit.streetController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    PaymentCubit.fNameController.dispose();
    PaymentCubit.lNameController.dispose();
    PaymentCubit.emailController.dispose();
    PaymentCubit.phoneController.dispose();
    PaymentCubit.cityController.dispose();
    PaymentCubit.streetController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    final totalPrice = args["totalPrice"] as int;
    final cartItems = args["items"] as List<GetCartProduct>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Paymen",
          style: getMediumStyle(fontSize: 20, color: ColorManager.text),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Form(
            key: PaymentCubit.globalKey,
            child: Column(
              children: [
                CustomTextField(
                  hint: "First name",
                  controller: PaymentCubit.fNameController,
                  validation: (val) {
                    return Validator.validateFullName(val);
                  },
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hint: "Last name",
                  controller: PaymentCubit.lNameController,
                  validation: (val) {
                    return Validator.validateFullName(val);
                  },
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hint: "Email",
                  controller: PaymentCubit.emailController,
                  validation: (val) {
                    return Validator.validateEmail(val);
                  },
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hint: "Phone number",
                  controller: PaymentCubit.phoneController,
                  validation: (val) {
                    return Validator.validatePhoneNumber(val);
                  },
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hint: "City",
                  controller: PaymentCubit.cityController,
                  validation: (val) {
                    return Validator.validateFullName(val);
                  },
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hint: "Street",
                  controller: PaymentCubit.streetController,
                  validation: (val) {
                    return Validator.validateFullName(val);
                  },
                ),

                SizedBox(height: 20.h),

                BlocListener<PaymentCubit, PaymentState>(
                  listener: (context, state) {
                    if (state is RequestTokenPaymentLoadingState) {
                      const LoadingIndicator();
                    } else if (state is RequestTokenPaymentErrorrState) {
                      UIUtils.showMessage(state.message);
                    } else if (state is RequestTokenPaymentSuccessState) {
                      Navigator.of(context).pushNamed(
                        Routes.paymentMethodScreen,
                        arguments: state.token,
                      );
                      PaymentCubit.clearFields();
                    }
                  },

                  child: CustomElevatedButton(
                    label: "Lets go",
                    onTap: () async {
                      final price = totalPrice * 100;
                      if (PaymentCubit.globalKey.currentState!.validate()) {
                        final items = cartItems.map<ItemOrderId>((item) {
                          return ItemOrderId(
                            name: item.product!.title!,
                            amountCents: "${(item.price! * 100).toInt()}",
                            description:
                                item.product?.description ??
                                "No description available",
                            quantity: "${item.count}",
                          );
                        }).toList();

                        final orderIdPaymantRequest = OrderIdPaymantRequest(
                          amountCents: "$price",
                          deliveryNeeded: "false",
                          currency: "EGP",
                          items: items,
                        );

                        final requestTokenPaymantRequest =
                            RequestTokenPaymantRequest(
                              billingData: BillingData(
                                firstName: PaymentCubit.fNameController.text,
                                lastName: PaymentCubit.lNameController.text,
                                email: PaymentCubit.emailController.text,
                                phoneNumber: PaymentCubit.phoneController.text,
                                city: PaymentCubit.cityController.text,
                                street: PaymentCubit.streetController.text,
                              ),
                              amountCents: "$price",
                            );
                        PaymentCubit.get(context).getRequesTokenPayment(
                          orderIdPaymantRequest: orderIdPaymantRequest,
                          requestTokenPaymantRequest:
                              requestTokenPaymantRequest,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
