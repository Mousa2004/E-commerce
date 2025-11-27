import 'package:ecommerce/features/wishlist/data/data_sources/remote/remote_wishlist_data_sources.dart';
import 'package:ecommerce/features/wishlist/domin/entities/add_product_to_wishlist/add_product_to_wishlist_response.dart';
import 'package:ecommerce/features/wishlist/domin/entities/get_product_from_wishlist/get_product_from_wishlist_response.dart';
import 'package:ecommerce/features/wishlist/domin/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  RemoteWishlistDataSources remoteWishlistDataSources;
  WishlistRepositoryImpl({required this.remoteWishlistDataSources});
  @override
  Future<AddProductToWishlistResponse> addProductToWishlist({
    String? productId,
  }) {
    return remoteWishlistDataSources.addProductToWishlist(productId: productId);
  }

  @override
  Future<GetProductFromWishlistResponse> getProductFromWishlist() {
    return remoteWishlistDataSources.getProductFromWishlist();
  }
}
