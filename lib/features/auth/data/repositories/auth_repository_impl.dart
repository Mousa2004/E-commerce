import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_sources.dart';
import 'package:ecommerce/features/auth/domin/entities/request/login_request_dto.dart';
import 'package:ecommerce/features/auth/domin/entities/request/register_request_dto.dart';
import 'package:ecommerce/features/auth/domin/entities/response/auth_response_dto.dart';
import 'package:ecommerce/features/auth/domin/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSources remoteDataSources;
  AuthRepositoryImpl({required this.remoteDataSources});
  @override
  Future<AuthResponseDto> login(LoginRequestDto loginRequest) async {
    final authResponse = await remoteDataSources.login(loginRequest);
    return authResponse;
  }

  @override
  Future<AuthResponseDto> register(RegisterRequestDto registerRequest) async {
    final authResponse = await remoteDataSources.register(registerRequest);
    return authResponse;
  }
}
