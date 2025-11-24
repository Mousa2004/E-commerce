import 'package:ecommerce/features/cart/domin/entities/add_cart/add_cart_response.dart';

abstract class AddCartRemoteDataSources {
  Future<AddCartResponse> addCart(String productId);
}
