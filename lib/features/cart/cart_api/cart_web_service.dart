import 'package:dio/dio.dart';
import 'package:ecommerce/core/endpoints/api_endpoints.dart';

import 'package:ecommerce/features/cart/cart_api/model/request/add_cart_request_dto.dart';
import 'package:ecommerce/features/cart/cart_api/model/request/update_cart_request_dto.dart';
import 'package:ecommerce/features/cart/cart_api/model/response/add_cart/add_cart_response_dto.dart';
import 'package:ecommerce/features/cart/cart_api/model/response/get_cart/get_cart_response_dto.dart';
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

  @GET(ApiEndpoints.apiGetCart)
  Future<GetCartResponseDto> getCart(@Header('token') String token);

  @DELETE(ApiEndpoints.apiDeleteCart)
  Future<GetCartResponseDto> deleteCart(
    @Header('token') String token,
    @Path() String productId,
  );

  @PUT(ApiEndpoints.apiUpdateCart)
  Future<GetCartResponseDto> updateCart(
    @Header('token') String token,
    @Path() String productId,
    @Body() UpdateCartRequestDto pdateCartRequest,
  );
}
