import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:ecommerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:ecommerce/features/cart/presentation/widgets/total_price_and_checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen();

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    CartCubit.get(context).getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.text),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: EdgeInsets.only(
            top: Insets.s14.sp,
            left: Insets.s14.sp,
            right: Insets.s14.sp,
          ),
          child: BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              if (state is DeleteCartSuccessState) {
                UIUtils.showMessage("Deleted successfully");
              } else if (state is UpdateCountCartSuccessState) {
                UIUtils.showMessage("Updated successfully");
              }
            },

            builder: (context, state) {
              if (state is GetCartErrorState) {
                return Center(
                  child: Text(
                    state.message,
                    style: getBoldStyle(color: ColorManager.primary),
                  ),
                );
              }

              final viewmodel = (state is GetCartSuccessState)
                  ? state.getCart
                  : (state is UpdateCountCartSuccessState)
                  ? state.getCart
                  : (state is DeleteCartSuccessState)
                  ? state.getCart
                  : null;

              if (viewmodel == null) {
                return const LoadingIndicator();
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, index) {
                        final productId =
                            viewmodel.products![index].product!.id;

                        return CartItem(
                          cartProduct: viewmodel.products![index],
                          onDecrement: (count) {
                            CartCubit.get(
                              context,
                            ).updateCountCart(productId!, count);
                          },

                          onIncrement: (count) {
                            CartCubit.get(
                              context,
                            ).updateCountCart(productId!, count);
                          },

                          deleteCart: () {
                            CartCubit.get(context).deleteCart(productId!);
                          },
                        );
                      },

                      itemCount: viewmodel.products!.length,
                      separatorBuilder: (_, __) =>
                          SizedBox(height: Sizes.s12.h),
                    ),
                  ),

                  TotalPriceAndCheckoutButton(
                    totalPrice: viewmodel.totalCartPrice!,
                    checkoutButtonOnTap: () {},
                  ),

                  SizedBox(height: 10.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
