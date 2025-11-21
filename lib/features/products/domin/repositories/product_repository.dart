import 'package:ecommerce/features/products/domin/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>?> getAllProducts();
}
