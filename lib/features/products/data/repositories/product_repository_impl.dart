import 'package:ecommerce/features/products/data/data_sources/remote/product_remote_data_sources.dart';
import 'package:ecommerce/features/products/domin/entities/product.dart';
import 'package:ecommerce/features/products/domin/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSources productRemoteDataSources;
  ProductRepositoryImpl({required this.productRemoteDataSources});
  @override
  Future<List<Product>?> getAllProducts() {
    return productRemoteDataSources.getAllProducts();
  }
}
