import 'package:ecommerce/features/auth/domin/entities/response/auth_response_dto.dart';

abstract class AuthState {}

class IntialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  AuthResponseDto authResponse;
  AuthSuccessState({required this.authResponse});
}

class AuthErrotState extends AuthState {
  String message;
  AuthErrotState({required this.message});
}
