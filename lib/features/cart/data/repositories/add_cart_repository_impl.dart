import 'package:ecommerce/features/cart/data/data_sources/remote/add_cart_remote_data_sources.dart';
import 'package:ecommerce/features/cart/domin/entities/add_cart/add_cart_response.dart';
import 'package:ecommerce/features/cart/domin/repositories/add_cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddCartRepository)
class AddCartRepositoryImpl implements AddCartRepository {
  AddCartRemoteDataSources addCartRemoteDataSources;
  AddCartRepositoryImpl({required this.addCartRemoteDataSources});
  @override
  Future<AddCartResponse> addCart(String productId) {
    return addCartRemoteDataSources.addCart(productId);
  }
}
