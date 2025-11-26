import 'package:dio/dio.dart';
import 'package:ecommerce/core/cache/shared_prefrence_utls.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/core/mapper/add_cart_response_mapper.dart';
import 'package:ecommerce/core/mapper/get_cart_response_mapper.dart';
import 'package:ecommerce/features/cart/cart_api/cart_web_service.dart';
import 'package:ecommerce/features/cart/cart_api/model/request/add_cart_request_dto.dart';
import 'package:ecommerce/features/cart/cart_api/model/request/update_cart_request_dto.dart';
import 'package:ecommerce/features/cart/data/data_sources/remote/cart_remote_data_sources.dart';
import 'package:ecommerce/features/cart/domin/entities/add_cart/add_cart_response.dart';
import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDataSources)
class CartRemoteDataSourcesImpl implements CartRemoteDataSources {
  CartWebService cartWebService;
  CartRemoteDataSourcesImpl({required this.cartWebService});
  @override
  Future<AddCartResponse> addCart(String productId) async {
    final AddCartRequestDto addCartRequestDto = AddCartRequestDto(
      productId: productId,
    );
    final String token = (SharedPrefrenceUtls.getData(key: "token") as String);
    try {
      final addCardResponseDto = await cartWebService.addCart(
        addCartRequestDto,
        token,
      );
      //todo: addCardResponseDto => addCardResponse
      return addCardResponseDto.convertToAddCartResponse();
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> getCart() async {
    final String token = (SharedPrefrenceUtls.getData(key: "token") as String);
    try {
      final getCardResponseDto = await cartWebService.getCart(token);
      //todo: getCardResponseDto => getCardResponse
      return getCardResponseDto.convertToGetCartResponse();
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> deleteCart(String productId) async {
    final String token = (SharedPrefrenceUtls.getData(key: "token") as String);
    try {
      final deleteCardResponseDto = await cartWebService.deleteCart(
        token,
        productId,
      );
      //todo: getCardResponseDto => getCardResponse
      return deleteCardResponseDto.convertToGetCartResponse();
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> updateCountCart(String productId, int count) async {
    final String token = (SharedPrefrenceUtls.getData(key: "token") as String);
    try {
      final updateCountCardResponseDto = await cartWebService.updateCart(
        token,
        productId,
        UpdateCartRequestDto(count: count.toString()),
      );
      //todo: getCardResponseDto => getCardResponse
      return updateCountCardResponseDto.convertToGetCartResponse();
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
