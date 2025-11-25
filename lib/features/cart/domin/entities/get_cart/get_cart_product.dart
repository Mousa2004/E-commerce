import 'package:ecommerce/features/products/domin/entities/product.dart';

class GetCartProduct {
  int? count;
  String? id;
  Product? product;
  int? price;

  GetCartProduct({this.count, this.id, this.product, this.price});
}
