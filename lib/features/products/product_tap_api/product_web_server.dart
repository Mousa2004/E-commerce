import 'package:dio/dio.dart';
import 'package:ecommerce/core/endpoints/api_endpoints.dart';
import 'package:ecommerce/features/products/product_tap_api/model/product_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'product_web_server.g.dart';

@RestApi()
abstract class ProductWebServer {
  factory ProductWebServer(Dio dio, {String? baseUrl}) = _ProductWebServer;

  @GET(ApiEndpoints.apiProducts)
  Future<ProductResponseDto> getAllProducts();
}
