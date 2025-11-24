import 'package:ecommerce/features/cart/cart_api/model/add_cart/response/product_cart_dto.dart';
import 'package:ecommerce/features/cart/domin/entities/add_cart/product_cart.dart';

extension CartProductMapper on ProductCartDto {
  ProductCart convertToProductCart() {
    return ProductCart(id: id, count: count, price: price, product: product);
  }
}
