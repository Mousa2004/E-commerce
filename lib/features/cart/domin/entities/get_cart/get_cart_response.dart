import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart.dart';

class GetCartResponse {
  String? status;
  int? numOfCartItems;
  String? cartId;
  GetCart? data;

  GetCartResponse({this.status, this.numOfCartItems, this.cartId, this.data});
}
