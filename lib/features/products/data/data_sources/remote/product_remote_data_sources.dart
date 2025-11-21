import 'package:ecommerce/features/products/domin/entities/product.dart';

abstract class ProductRemoteDataSources {
  Future<List<Product>?> getAllProducts();
}
