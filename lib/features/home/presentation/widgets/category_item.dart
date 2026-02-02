import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home_tab/domin/entities/category.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final void Function()? onTap;
  const CategoryItem({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              padding: EdgeInsets.all(5.sp),
              height: 100.h,
              width: 100.w,
              child: CachedNetworkImage(
                imageUrl: category.image ?? "",
                fit: BoxFit.fill,
                placeholder: (context, url) => const LoadingIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error_outline_sharp),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              category.slug ?? "",
              style: getRegularStyle(
                color: ColorManager.darkBlue,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
