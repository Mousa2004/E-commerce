import 'package:dio/dio.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/core/mapper/product_mapper.dart';
import 'package:ecommerce/features/products/data/data_sources/remote/product_remote_data_sources.dart';
import 'package:ecommerce/features/products/domin/entities/product.dart';
import 'package:ecommerce/features/products/product_tap_api/product_web_server.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRemoteDataSources)
class ProductRemoteDataSourcesImpl implements ProductRemoteDataSources {
  ProductWebServer productWebServer;
  ProductRemoteDataSourcesImpl({required this.productWebServer});

  @override
  Future<List<Product>?> getBrandProducts({String? brandId}) async {
    try {
      final productResponseDto = await productWebServer.getBrandProducts(
        brandId!,
      );
      //todo: productDto => product
      return productResponseDto.product!
          .map((productDto) => productDto.convertToProduct())
          .toList();
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<List<Product>?> getCategoryProducts({String? categoryId}) async {
    try {
      final productResponseDto = await productWebServer.getCategoryProducts(
        categoryId!,
      );
      //todo: productDto => product
      return productResponseDto.product!
          .map((productDto) => productDto.convertToProduct())
          .toList();
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
