import 'package:dio/dio.dart';
import 'package:ecommerce/core/endpoints/api_endpoints.dart';

import 'package:ecommerce/features/cart/cart_api/model/add_cart/request/add_cart_request_dto.dart';
import 'package:ecommerce/features/cart/cart_api/model/add_cart/response/add_cart_response_dto.dart';
import 'package:retrofit/retrofit.dart' hide Headers;

part 'cart_web_service.g.dart';

@RestApi()
abstract class CartWebService {
  factory CartWebService(Dio dio, {String? baseUrl}) = _CartWebService;
  @POST(ApiEndpoints.apiAddCart)
  Future<AddCartResponseDto> addCart(
    @Body() AddCartRequestDto addCartRequestDto,
    @Header('token') String token,
  );
}
