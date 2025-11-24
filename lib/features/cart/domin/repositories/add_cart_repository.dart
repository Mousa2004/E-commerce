import 'package:ecommerce/features/cart/domin/entities/add_cart/add_cart_response.dart';

abstract class AddCartRepository {
  Future<AddCartResponse> addCart(String productId);
}
