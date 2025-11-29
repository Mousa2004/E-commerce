import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/features/products/domin/entities/product.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/custom_auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItemDetails extends StatelessWidget {
  const WishlistItemDetails({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final bool hasDiscount =
        product.priceAfterDiscount != null && product.priceAfterDiscount! > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomAutoSizeText(
          data: product.title ?? "",
          textStyle: getSemiBoldStyle(
            color: ColorManager.primaryDark,
            fontSize: FontSize.s18,
          ),
        ),
        SizedBox(height: Sizes.s8.h),
        Row(
          children: [
            CustomAutoSizeText(
              data: hasDiscount
                  ? 'EGP ${product.priceAfterDiscount}'
                  : 'EGP ${product.price}',
              textStyle: getSemiBoldStyle(
                color: ColorManager.primaryDark,
                fontSize: FontSize.s18,
              ).copyWith(letterSpacing: 0.17),
            ),
            SizedBox(width: Sizes.s8.w),
            if (hasDiscount)
              Flexible(
                child: CustomAutoSizeText(
                  data: 'EGP ${product.price}',
                  textStyle:
                      getMediumStyle(
                        color: ColorManager.appBarTitle.withOpacity(0.6),
                        fontSize: FontSize.s10,
                      ).copyWith(
                        letterSpacing: 0.17,
                        decoration: TextDecoration.lineThrough,
                      ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
