import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart_product.dart';

class GetCart {
  String? id;
  String? cartOwner;
  List<GetCartProduct>? products;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? totalCartPrice;

  GetCart({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}
