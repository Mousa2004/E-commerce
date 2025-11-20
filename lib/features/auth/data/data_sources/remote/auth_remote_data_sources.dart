import 'package:ecommerce/features/auth/domin/entities/request/login_request_dto.dart';
import 'package:ecommerce/features/auth/domin/entities/request/register_request_dto.dart';
import 'package:ecommerce/features/auth/domin/entities/response/auth_response_dto.dart';

abstract class AuthRemoteDataSources {
  Future<AuthResponseDto> login(LoginRequestDto loginRequest);
  Future<AuthResponseDto> register(RegisterRequestDto registerRequest);
}
