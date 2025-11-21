import 'package:ecommerce/features/home_tab/domin/entities/metadata.dart';
import 'package:ecommerce/features/products/domin/entities/product.dart';

class ProductResponse {
  int? results;
  Metadata? metadata;
  List<Product>? product;

  ProductResponse({this.results, this.metadata, this.product});
}
