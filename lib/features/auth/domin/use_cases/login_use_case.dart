import 'package:ecommerce/features/auth/domin/entities/request/login_request_dto.dart';
import 'package:ecommerce/features/auth/domin/entities/response/auth_response_dto.dart';
import 'package:ecommerce/features/auth/domin/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  Future<AuthResponseDto> login(LoginRequestDto loginRequest) {
    return authRepository.login(loginRequest);
  }
}
