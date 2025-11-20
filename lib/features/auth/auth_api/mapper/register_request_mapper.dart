import 'package:ecommerce/features/auth/auth_api/model/request/register_request.dart';
import 'package:ecommerce/features/auth/domin/entities/request/register_request_dto.dart';

extension RegisterRequestMapper on RegisterRequestDto {
  RegisterRequest convertToRegisterRequest() {
    return RegisterRequest(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }
}
