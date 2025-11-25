import 'package:ecommerce/features/cart/domin/entities/add_cart/add_cart_response.dart';
import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart_response.dart';

abstract class CartRepository {
  Future<AddCartResponse> addCart(String productId);
  Future<GetCartResponse> getCart();
  Future<GetCartResponse> deleteCart(String productId);
}
