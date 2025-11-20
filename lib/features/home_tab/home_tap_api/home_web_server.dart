import 'package:dio/dio.dart';
import 'package:ecommerce/core/endpoints/api_endpoints.dart';
import 'package:ecommerce/features/home_tab/home_tap_api/model/category_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'home_web_server.g.dart';

@RestApi()
abstract class HomeWebServer {
  factory HomeWebServer(Dio dio, {String? baseUrl}) = _HomeWebServer;

  @GET(ApiEndpoints.apiCategories)
  Future<CategoryResponseDto> getAllCategories();
}
