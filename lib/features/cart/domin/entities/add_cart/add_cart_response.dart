import 'package:ecommerce/features/cart/domin/entities/add_cart/add_cart.dart';

class AddCartResponse {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  AddCart? data;

  AddCartResponse({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}
