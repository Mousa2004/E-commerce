import 'package:dio/dio.dart';
import 'package:ecommerce/core/cache/shared_prefrence_utls.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/core/mapper/add_cart_response_mapper.dart';
import 'package:ecommerce/features/cart/cart_api/cart_web_service.dart';
import 'package:ecommerce/features/cart/cart_api/model/add_cart/request/add_cart_request_dto.dart';
import 'package:ecommerce/features/cart/data/data_sources/remote/add_cart_remote_data_sources.dart';
import 'package:ecommerce/features/cart/domin/entities/add_cart/add_cart_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddCartRemoteDataSources)
class AddCartRemoteDataSourcesImpl implements AddCartRemoteDataSources {
  CartWebService cartWebService;
  AddCartRemoteDataSourcesImpl({required this.cartWebService});
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
}
