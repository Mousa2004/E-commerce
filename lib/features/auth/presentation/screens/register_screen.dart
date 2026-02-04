import 'package:ecommerce/core/cache/shared_prefrence_utls.dart';
import 'package:ecommerce/core/injctable/di.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/utils/validator.dart';
import 'package:ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:ecommerce/core/widgets/custom_text_field.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController(text: "Mohamed ayman");
  final _emailController = TextEditingController(
    text: "mohamedyasser2589@gmail.com",
  );
  final _phoneController = TextEditingController(text: "01523963258");
  final _passwordController = TextEditingController(
    text: "mohamedahmed2589@mam",
  );
  final _rePasswordController = TextEditingController(
    text: "mohamedahmed2589@mam",
  );
  var viewModel = getIt<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          UIUtils.showLoading(context);
        } else if (state is AuthErrotState) {
          UIUtils.hideLoading(context);
          UIUtils.showMessage(state.message);
        } else if (state is AuthSuccessState) {
          UIUtils.hideLoading(context);
          UIUtils.showMessage("Register Successfully");
          Navigator.of(context).pushReplacementNamed(Routes.login);
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Insets.s20.sp),
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Sizes.s40.h),
                    Center(child: SvgPicture.asset(SvgAssets.route)),
                    SizedBox(height: Sizes.s40.h),
                    CustomTextField(
                      backgroundColor: ColorManager.white,
                      hint: 'enter your full name',
                      label: 'Full Name',
                      textInputType: TextInputType.name,
                      validation: Validator.validateFullName,
                      controller: _nameController,
                    ),
                    SizedBox(height: Sizes.s18.h),
                    CustomTextField(
                      hint: 'enter your mobile no.',
                      backgroundColor: ColorManager.white,
                      label: 'Mobile Number',
                      validation: Validator.validatePhoneNumber,
                      textInputType: TextInputType.phone,
                      controller: _phoneController,
                    ),
                    SizedBox(height: Sizes.s18.h),
                    CustomTextField(
                      hint: 'enter your email address',
                      backgroundColor: ColorManager.white,
                      label: 'E-mail address',
                      validation: Validator.validateEmail,
                      textInputType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    SizedBox(height: Sizes.s18.h),
                    CustomTextField(
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'password',
                      validation: Validator.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                      controller: _passwordController,
                    ),
                    SizedBox(height: Sizes.s18.h),
                    CustomTextField(
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'RePassword',
                      validation: (val) {
                        return Validator.validateConfirmPassword(
                          val,
                          _passwordController.text,
                        );
                      },
                      isObscured: true,
                      textInputType: TextInputType.text,
                      controller: _rePasswordController,
                    ),
                    SizedBox(height: Sizes.s50.h),
                    Center(
                      child: SizedBox(
                        height: Sizes.s60.h,
                        width: MediaQuery.sizeOf(context).width * .9,
                        child: CustomElevatedButton(
                          label: 'Register',
                          backgroundColor: ColorManager.white,
                          isStadiumBorder: false,
                          textStyle: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s20,
                          ),
                          onTap: () async {
                            await SharedPrefrenceUtls.saveData(
                              key: 'name',
                              value: _nameController.text,
                            );
                            await SharedPrefrenceUtls.saveData(
                              key: 'email',
                              value: _emailController.text,
                            );
                            await SharedPrefrenceUtls.saveData(
                              key: 'password',
                              value: _passwordController.text,
                            );
                            await SharedPrefrenceUtls.saveData(
                              key: 'phone',
                              value: _phoneController.text,
                            );
                            viewModel.register(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              rePassword: _rePasswordController.text,
                              phone: _phoneController.text,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: getSemiBoldStyle(
                            color: ColorManager.white,
                          ).copyWith(fontSize: FontSize.s16),
                        ),
                        SizedBox(width: Sizes.s8.w),
                        GestureDetector(
                          onTap: () => Navigator.of(
                            context,
                          ).pushReplacementNamed(Routes.login),
                          child: Text(
                            'Login',
                            style: getSemiBoldStyle(
                              color: ColorManager.white,
                            ).copyWith(fontSize: FontSize.s16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }
}
