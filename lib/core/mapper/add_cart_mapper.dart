import 'package:ecommerce/core/mapper/cart_product_mapper.dart';
import 'package:ecommerce/features/cart/cart_api/model/add_cart/response/add_cart_dto.dart';
import 'package:ecommerce/features/cart/domin/entities/add_cart/add_cart.dart';

extension AddCartMapper on AddCartDto {
  AddCart convertAddCart() {
    return AddCart(
      id: id,
      cartOwner: cartOwner,
      createdAt: createdAt,
      totalCartPrice: totalCartPrice,
      updatedAt: updatedAt,
      v: v,
      products: products!
          .map((productsDto) => productsDto.convertToProductCart())
          .toList(),
    );
  }
}
