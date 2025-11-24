import 'package:ecommerce/features/cart/domin/entities/add_cart/product_cart.dart';

class AddCart {
  String? id;
  String? cartOwner;
  List<ProductCart>? products;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? totalCartPrice;

  AddCart({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}
