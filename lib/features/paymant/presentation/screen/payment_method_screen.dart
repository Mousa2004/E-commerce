import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/features/paymant/presentation/widget/paymob_web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String token = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ColorManager.darkBlue,
                    ),
                  ),
                  Text(
                    "Choose a payment method",
                    style: getBoldStyle(
                      color: ColorManager.primary,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => PaymobWebViewScreen(token: token),
                    ),
                  );
                },
                child: Image.asset(
                  ImageAssets.visaImage,
                  height: 100,
                  width: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
