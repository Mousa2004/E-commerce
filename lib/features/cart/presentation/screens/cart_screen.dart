import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
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
          child: BlocListener<CartCubit, CartState>(
            listener: (context, state) {
              if (state is DeleteCartSuccessState) {
                UIUtils.showMessage("Deleted successfully");
              }
            },
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is GetCartErrorState) {
                  return Center(
                    child: Text(
                      state.message,
                      style: getBoldStyle(color: ColorManager.primary),
                    ),
                  );
                } else if (state is GetCartSuccessState) {
                  final viewmodel = state.getCart;
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (_, index) {
                            return CartItem(
                              cartProduct: viewmodel.products![index],
                              onTap: () => Navigator.of(context).pushNamed(
                                Routes.productDetails,
                                arguments: viewmodel.products![index].product,
                              ),
                              deleteCart: () {
                                final productId =
                                    viewmodel.products![index].product!.id;
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
                } else if (state is DeleteCartSuccessState) {
                  final viewmodel = state.getCart;
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (_, index) {
                            return CartItem(
                              cartProduct: viewmodel.products![index],
                              onTap: () => Navigator.of(context).pushNamed(
                                Routes.productDetails,
                                arguments: viewmodel.products![index].product,
                              ),
                              deleteCart: () {
                                final productId =
                                    viewmodel.products![index].product!.id;
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
                } else {
                  return const LoadingIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
