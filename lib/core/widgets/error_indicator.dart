import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorIndicator extends StatelessWidget {
  final String message;

  const ErrorIndicator([this.message = 'Something went wrong!']);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: getBoldStyle(color: ColorManager.black, fontSize: 20.sp),
      ),
    );
  }
}
