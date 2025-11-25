import 'package:ecommerce/core/mapper/product_mapper.dart';
import 'package:ecommerce/features/cart/cart_api/model/response/get_cart/get_cart_product_dto.dart';
import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart_product.dart';

extension GetCartProductMapper on GetCartProductDto {
  GetCartProduct convertToGetCartProduct() {
    return GetCartProduct(
      count: count,
      id: id,
      price: price,
      product: product!.convertToProduct(),
    );
  }
}
