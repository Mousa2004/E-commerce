import 'package:ecommerce/features/auth/domin/entities/request/register_request_dto.dart';
import 'package:ecommerce/features/auth/domin/entities/response/auth_response_dto.dart';
import 'package:ecommerce/features/auth/domin/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthRepository athRepository;
  RegisterUseCase({required this.athRepository});
  Future<AuthResponseDto> register(RegisterRequestDto registerRequest) {
    return athRepository.register(registerRequest);
  }
}
