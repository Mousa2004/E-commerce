import 'package:dio/dio.dart';
import 'package:ecommerce/core/cache/shared_prefrence_utls.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/core/mapper/add_product_to_wishlist_mapper.dart';
import 'package:ecommerce/core/mapper/delete_product_from_wishlist_mapper.dart';
import 'package:ecommerce/core/mapper/get_product_from_wishlist_response_mapper.dart';
import 'package:ecommerce/features/wishlist/data/data_sources/remote/remote_wishlist_data_sources.dart';
import 'package:ecommerce/features/wishlist/domin/entities/add_product_to_wishlist/add_product_to_wishlist_response.dart';
import 'package:ecommerce/features/wishlist/domin/entities/delete_product_from_wishlist/delete_product_from_wishlist_respose.dart';
import 'package:ecommerce/features/wishlist/domin/entities/get_product_from_wishlist/get_product_from_wishlist_response.dart';
import 'package:ecommerce/features/wishlist/wishlist_api/model/add_product_to_wishlist/request/add_wishlist_request_dto.dart';
import 'package:ecommerce/features/wishlist/wishlist_api/wishlist_web_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteWishlistDataSources)
class RemoteWishlistDataSourcesImpl implements RemoteWishlistDataSources {
  WishlistWebService wishlistWebService;
  RemoteWishlistDataSourcesImpl({required this.wishlistWebService});
  @override
  Future<AddProductToWishlistResponse> addProductToWishlist({
    String? productId,
  }) async {
    final String token = (SharedPrefrenceUtls.getData(key: "token") as String);
    try {
      final addProductToWishlistDto = await wishlistWebService.addToWishlist(
        token,
        AddWishlistRequestDto(productId: productId),
      );
      //todo: addProductToWishlistDto => addProductToWishlist
      return addProductToWishlistDto.convertToAddProductToWishlistResponse();
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetProductFromWishlistResponse> getProductFromWishlist() async {
    final String token = (SharedPrefrenceUtls.getData(key: "token") as String);
    try {
      final getProductFromWishlistDto = await wishlistWebService
          .getFromWishlist(token);
      //todo: getProductFromWishlistDto => getProductFromWishlist
      return getProductFromWishlistDto
          .convertToGetProductFromWishlistResponse();
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<DeleteProductFromWishlistRespose> deleteProductFromWishlist({
    String? productId,
  }) async {
    final String token = (SharedPrefrenceUtls.getData(key: "token") as String);
    try {
      final delteProductFromWishlistDto = await wishlistWebService
          .deleteFromWishlist(token, productId!);
      //todo: delteProductFromWishlistDto => delteProductFromWishlist
      return delteProductFromWishlistDto
          .convertToDeleteProductFromWishlistRespose();
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
