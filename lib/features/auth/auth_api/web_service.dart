import 'package:dio/dio.dart';
import 'package:ecommerce/core/endpoints/api_endpoints.dart';
import 'package:ecommerce/features/auth/auth_api/model/request/login_request.dart';
import 'package:ecommerce/features/auth/auth_api/model/request/register_request.dart';
import 'package:ecommerce/features/auth/auth_api/model/response/auth_response.dart';
import 'package:retrofit/retrofit.dart';

part 'web_service.g.dart';

@RestApi()
abstract class WebService {
  factory WebService(Dio dio, {String? baseUrl}) = _WebService;
  @POST(ApiEndpoints.apiLogin)
  Future<AuthResponse> login(@Body() LoginRequest loginRequest);
  @POST(ApiEndpoints.apiRegister)
  Future<AuthResponse> register(@Body() RegisterRequest registerReques);
}
