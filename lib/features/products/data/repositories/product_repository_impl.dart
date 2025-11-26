import 'package:ecommerce/features/products/data/data_sources/remote/product_remote_data_sources.dart';
import 'package:ecommerce/features/products/domin/entities/product.dart';
import 'package:ecommerce/features/products/domin/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSources productRemoteDataSources;
  ProductRepositoryImpl({required this.productRemoteDataSources});

  @override
  Future<List<Product>?> getBrandProducts({String? brandId}) {
    return productRemoteDataSources.getBrandProducts(brandId: brandId);
  }

  @override
  Future<List<Product>?> getCategoryProducts({String? categoryId}) {
    return productRemoteDataSources.getCategoryProducts(categoryId: categoryId);
  }
}
