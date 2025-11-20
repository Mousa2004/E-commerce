import 'package:dio/dio.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/features/auth/domin/entities/request/login_request_dto.dart';
import 'package:ecommerce/features/auth/domin/entities/request/register_request_dto.dart';
import 'package:ecommerce/features/auth/domin/use_cases/login_use_case.dart';
import 'package:ecommerce/features/auth/domin/use_cases/register_use_case.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;
  AuthCubit({required this.loginUseCase, required this.registerUseCase})
    : super(IntialState());
  final formKey = GlobalKey<FormState>();
  void login({required String email, required String password}) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(AuthLoadingState());
        final loginReques = LoginRequestDto(email: email, password: password);
        final authResponse = await loginUseCase.login(loginReques);
        emit(AuthSuccessState(authResponse: authResponse));
      } on AppException catch (e) {
        emit(AuthErrotState(message: e.message!));
      } on DioException catch (e) {
        final message = (e.error is AppException)
            ? (e.error as AppException).message
            : "Unexcepted error occurred";
        emit(AuthErrotState(message: message!));
      }
    }
  }

  void register({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(AuthLoadingState());
        final registerRequest = RegisterRequestDto(
          name: name,
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone,
        );

        final authResponse = await registerUseCase.register(registerRequest);
        emit(AuthSuccessState(authResponse: authResponse));
      } on AppException catch (e) {
        emit(AuthErrotState(message: e.toString()));
      } on DioException catch (e) {
        final message = (e.error is AppException)
            ? (e.error as AppException).message
            : "Unexcepted error occurred";
        emit(AuthErrotState(message: message!));
      }
    }
  }
}
