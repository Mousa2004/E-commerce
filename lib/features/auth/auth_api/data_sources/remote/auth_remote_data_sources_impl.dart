import 'package:ecommerce/core/cache/shared_prefrence_utls.dart';
import 'package:ecommerce/core/mapper/auth_response_mapper.dart';
import 'package:ecommerce/core/mapper/login_request_mapper.dart';
import 'package:ecommerce/core/mapper/register_request_mapper.dart';
import 'package:ecommerce/features/auth/auth_api/web_service.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_sources.dart';
import 'package:ecommerce/features/auth/domin/entities/request/login_request_dto.dart';
import 'package:ecommerce/features/auth/domin/entities/request/register_request_dto.dart';
import 'package:ecommerce/features/auth/domin/entities/response/auth_response_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSources)
class AuthRemoteDataSourcesImpl implements AuthRemoteDataSources {
  WebService webService;
  AuthRemoteDataSourcesImpl({required this.webService});
  @override
  Future<AuthResponseDto> login(LoginRequestDto loginRequest) async {
    //todo:LoginRequestDto => LoginRequest
    final authResponse = await webService.login(
      loginRequest.convertToLoginRequest(),
    );

    //todo: Save token
    SharedPrefrenceUtls.saveData(key: "token", value: authResponse.token);

    //todo:AuthResponse => AuthResponseDto
    return authResponse.convetToAuthResponseDto();
  }

  @override
  Future<AuthResponseDto> register(RegisterRequestDto registerReques) async {
    //todo:RegisterRequestDto => RegisterRequest
    final authResponse = await webService.register(
      registerReques.convertToRegisterRequest(),
    );

    //todo: Save token
    SharedPrefrenceUtls.saveData(key: "token", value: authResponse.token);

    return authResponse.convetToAuthResponseDto();
  }
}
