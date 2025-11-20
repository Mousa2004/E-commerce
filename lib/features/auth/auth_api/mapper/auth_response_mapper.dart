import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/features/auth/auth_api/mapper/user_mapper.dart';
import 'package:ecommerce/features/auth/auth_api/model/response/auth_response.dart';
import 'package:ecommerce/features/auth/domin/entities/response/auth_response_dto.dart';

extension AuthResponseMapper on AuthResponse {
  AuthResponseDto convetToAuthResponseDto() {
    if (user != null && token!.isNotEmpty && token != null) {
      return AuthResponseDto(userDto: user!.convertToUser(), token: token);
    }
    throw ServerException(message: message);
  }
}
