import 'package:ecommerce/features/products/domin/entities/product.dart';
import 'package:ecommerce/features/products/domin/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryProductUseCase {
  ProductRepository productRepository;
  CategoryProductUseCase({required this.productRepository});
  Future<List<Product>?> invoke({String? categoryId}) {
    return productRepository.getCategoryProducts(categoryId: categoryId);
  }
}
