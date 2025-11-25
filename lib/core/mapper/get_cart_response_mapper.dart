import 'package:ecommerce/core/mapper/get_cart_mapper.dart';
import 'package:ecommerce/features/cart/cart_api/model/response/get_cart/get_cart_response_dto.dart';
import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart_response.dart';

extension GetCartResponseMapper on GetCartResponseDto {
  GetCartResponse convertToGetCartResponse() {
    return GetCartResponse(
      cartId: cartId,
      numOfCartItems: numOfCartItems,
      status: status,
      data: data!.convertToGetCart(),
    );
  }
}
