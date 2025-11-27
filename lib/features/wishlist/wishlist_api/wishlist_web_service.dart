import 'package:dio/dio.dart';
import 'package:ecommerce/core/endpoints/api_endpoints.dart';
import 'package:ecommerce/features/wishlist/wishlist_api/model/add_product_to_wishlist/add_product_to_wishlist_response_dto.dart';
import 'package:ecommerce/features/wishlist/wishlist_api/model/add_product_to_wishlist/request/add_wishlist_request_dto.dart';
import 'package:ecommerce/features/wishlist/wishlist_api/model/get_product_from_wishlist/get_product_from_wishlist_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'wishlist_web_service.g.dart';

@RestApi()
abstract class WishlistWebService {
  factory WishlistWebService(Dio dio, {String? baseUrl}) = _WishlistWebService;
  @POST(ApiEndpoints.apiaddToWishlist)
  Future<AddProductToWishlistResponseDto> addToWishlist(
    @Header('token') String token,
    @Body() AddWishlistRequestDto productId,
  );

  @GET(ApiEndpoints.apiaddToWishlist)
  Future<GetProductFromWishlistResponseDto> getFromWishlist(
    @Header('token') String token,
  );
}
