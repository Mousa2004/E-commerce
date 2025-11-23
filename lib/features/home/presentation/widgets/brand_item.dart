import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/features/home_tab/domin/entities/brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandItem extends StatelessWidget {
  final Brand brand;
  final void Function()? onTap;
  const BrandItem({required this.brand, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: CachedNetworkImage(
                imageUrl: brand.image ?? "",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            brand.slug ?? "",
            style: getRegularStyle(
              color: ColorManager.darkBlue,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
