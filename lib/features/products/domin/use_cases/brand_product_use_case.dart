import 'package:ecommerce/features/products/domin/entities/product.dart';
import 'package:ecommerce/features/products/domin/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandProductUseCase {
  ProductRepository productRepository;
  BrandProductUseCase({required this.productRepository});
  Future<List<Product>?> invoke({String? brandId}) {
    return productRepository.getBrandProducts(brandId: brandId);
  }
}
