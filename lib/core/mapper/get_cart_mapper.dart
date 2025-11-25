import 'package:ecommerce/core/mapper/get_cart_product_mapper.dart';
import 'package:ecommerce/features/cart/cart_api/model/response/get_cart/get_cart_dto.dart';
import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart.dart';

extension GetCartMapper on GetCartDto {
  GetCart convertToGetCart() {
    return GetCart(
      cartOwner: cartOwner,
      createdAt: createdAt,
      id: id,
      updatedAt: updatedAt,
      v: v,
      totalCartPrice: totalCartPrice,
      products: products!
          .map((getCartProduct) => getCartProduct.convertToGetCartProduct())
          .toList(),
    );
  }
}
