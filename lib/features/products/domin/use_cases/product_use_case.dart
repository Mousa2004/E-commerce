import 'package:ecommerce/features/products/domin/entities/product.dart';
import 'package:ecommerce/features/products/domin/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductUseCase {
  ProductRepository productRepository;
  ProductUseCase({required this.productRepository});
  Future<List<Product>?> invoke() {
    return productRepository.getAllProducts();
  }
}
