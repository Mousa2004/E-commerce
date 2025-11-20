import 'package:ecommerce/features/auth/auth_api/model/response/user.dart';
import 'package:ecommerce/features/auth/domin/entities/response/user_dto.dart';

extension UserMapper on User {
  UserDto convertToUser() {
    return UserDto(name: name, email: email);
  }
}
