import 'package:ecommerce/features/cart/data/data_sources/remote/cart_remote_data_sources.dart';
import 'package:ecommerce/features/cart/domin/entities/add_cart/add_cart_response.dart';
import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart_response.dart';
import 'package:ecommerce/features/cart/domin/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSources cartRemoteDataSources;
  CartRepositoryImpl({required this.cartRemoteDataSources});
  @override
  Future<AddCartResponse> addCart(String productId) {
    return cartRemoteDataSources.addCart(productId);
  }

  @override
  Future<GetCartResponse> getCart() {
    return cartRemoteDataSources.getCart();
  }

  @override
  Future<GetCartResponse> deleteCart(String productId) {
    return cartRemoteDataSources.deleteCart(productId);
  }

  @override
  Future<GetCartResponse> updateCountCart(String productId, int count) {
    return cartRemoteDataSources.updateCountCart(productId, count);
  }
}
