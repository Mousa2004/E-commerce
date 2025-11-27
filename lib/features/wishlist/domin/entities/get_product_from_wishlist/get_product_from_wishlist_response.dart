import 'package:ecommerce/features/products/domin/entities/product.dart';

class GetProductFromWishlistResponse {
  String? status;
  int? count;
  List<Product>? data;

  GetProductFromWishlistResponse({this.status, this.count, this.data});
}
