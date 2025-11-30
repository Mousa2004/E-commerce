import 'package:ecommerce/core/cache/shared_prefrence_utls.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab();

  @override
  ProfileTabState createState() => ProfileTabState();
}

class ProfileTabState extends State<ProfileTab> {
  bool _isFullNameReadOnly = true;
  bool _isEmailReadOnly = true;
  bool _isPasswordReadOnly = true;
  bool _isPhoneReadOnly = true;
  final name = SharedPrefrenceUtls.getData(key: 'name');
  final email = SharedPrefrenceUtls.getData(key: 'email');
  final password = SharedPrefrenceUtls.getData(key: 'password');
  final phone = SharedPrefrenceUtls.getData(key: 'phone');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Insets.s20.sp),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    SvgAssets.route,
                    height: Sizes.s40.h,
                    colorFilter: const ColorFilter.mode(
                      ColorManager.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //remove token
                      SharedPrefrenceUtls.removeData(key: "token");
                      Navigator.of(
                        context,
                      ).pushNamedAndRemoveUntil(Routes.login, (route) => false);
                    },
                    icon: const Icon(
                      Icons.logout,
                      size: 30,
                      color: ColorManager.appBarTitle,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Sizes.s20.h),
              Text(
                'Welcome, $name',
                style: getSemiBoldStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
              ),
              Text(
                '$email',
                style: getRegularStyle(
                  color: ColorManager.primary.withOpacity(.5),
                  fontSize: FontSize.s14,
                ),
              ),
              SizedBox(height: Sizes.s18.h),
              CustomTextField(
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: _isFullNameReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your full name',
                label: 'Full Name',
                controller: TextEditingController(text: '$name'),
                labelTextStyle: getMediumStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () => setState(() => _isFullNameReadOnly = false),
                ),
                textInputType: TextInputType.text,
                validation: Validator.validateFullName,
                hintTextStyle: getRegularStyle(
                  color: ColorManager.primary,
                ).copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: Sizes.s18.h),
              CustomTextField(
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: _isEmailReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your email address',
                label: 'E-mail address',
                controller: TextEditingController(text: '$email'),
                labelTextStyle: getMediumStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () => setState(() => _isEmailReadOnly = false),
                ),
                textInputType: TextInputType.emailAddress,
                validation: Validator.validateEmail,
                hintTextStyle: getRegularStyle(
                  color: ColorManager.primary,
                ).copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: Sizes.s18.h),
              CustomTextField(
                onTap: () => setState(() => _isPasswordReadOnly = false),
                controller: TextEditingController(text: '$password'),
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: _isPasswordReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your password',
                label: 'Password',
                isObscured: true,
                labelTextStyle: getMediumStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
                suffixIcon: SvgPicture.asset(SvgAssets.edit),
                textInputType: TextInputType.text,
                validation: Validator.validatePassword,
                hintTextStyle: getRegularStyle(
                  color: ColorManager.primary,
                ).copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: Sizes.s18.h),
              CustomTextField(
                controller: TextEditingController(text: '$phone'),
                borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                readOnly: _isPhoneReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your mobile no.',
                label: 'Your mobile number',
                labelTextStyle: getMediumStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () => setState(() => _isPhoneReadOnly = false),
                ),
                textInputType: TextInputType.phone,
                validation: Validator.validatePhoneNumber,
                hintTextStyle: getRegularStyle(
                  color: ColorManager.primary,
                ).copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: Sizes.s18.h),
              SizedBox(height: Sizes.s50.h),
            ],
          ),
        ),
      ),
    );
  }
}
