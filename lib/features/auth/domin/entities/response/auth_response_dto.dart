import 'package:ecommerce/features/auth/domin/entities/response/user_dto.dart';

class AuthResponseDto {
  UserDto? userDto;
  String? token;
  AuthResponseDto({required this.userDto, required this.token});
}
