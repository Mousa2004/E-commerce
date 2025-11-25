import 'package:ecommerce/core/mapper/add_cart_mapper.dart';
import 'package:ecommerce/features/cart/cart_api/model/response/add_cart/add_cart_response_dto.dart';
import 'package:ecommerce/features/cart/domin/entities/add_cart/add_cart_response.dart';

extension AddCartResponseMapper on AddCartResponseDto {
  AddCartResponse convertToAddCartResponse() {
    return AddCartResponse(
      cartId: cartId,
      message: message,
      numOfCartItems: numOfCartItems,
      status: status,
      data: data!.convertAddCart(),
    );
  }
}
