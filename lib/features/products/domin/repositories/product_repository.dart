import 'package:ecommerce/features/products/domin/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>?> getCategoryProducts({String? categoryId});
  Future<List<Product>?> getBrandProducts({String? brandId});
}
