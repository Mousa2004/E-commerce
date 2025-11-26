import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/product_counter.dart';
import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final GetCartProduct cartProduct;
  final void Function()? deleteCart;
  final void Function(int) onIncrement;
  final void Function(int) onDecrement;
  const CartItem({
    required this.cartProduct,
    required this.onDecrement,
    required this.onIncrement,
    required this.deleteCart,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Container(
      height: isPortrait ? height * 0.14 : width * 0.23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
            ),
            child: CachedNetworkImage(
              imageUrl: cartProduct.product?.imageCover ?? "",
              fit: BoxFit.cover,
              height: isPortrait ? height * 0.142 : height * 0.23,
              width: isPortrait ? width * 0.29 : 165.w,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Insets.s8.w,
                vertical: Insets.s8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          cartProduct.product?.title ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                            color: ColorManager.text,
                            fontSize: FontSize.s18,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: deleteCart,
                        child: Image.asset(
                          IconsAssets.delete,
                          color: ColorManager.text,
                          height: 22.h,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'EGP ${cartProduct.price ?? 0}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                            color: ColorManager.text,
                            fontSize: FontSize.s18,
                          ),
                        ),
                      ),
                      ProductCounter(
                        initialValue: cartProduct.count!,
                        onIncrement: onIncrement,
                        onDecrement: onDecrement,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
