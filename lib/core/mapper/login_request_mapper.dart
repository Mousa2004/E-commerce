import 'package:ecommerce/features/auth/auth_api/model/request/login_request.dart';
import 'package:ecommerce/features/auth/domin/entities/request/login_request_dto.dart';

extension LoginRequestMapper on LoginRequestDto {
  LoginRequest convertToLoginRequest() {
    return LoginRequest(email: email, password: password);
  }
}
