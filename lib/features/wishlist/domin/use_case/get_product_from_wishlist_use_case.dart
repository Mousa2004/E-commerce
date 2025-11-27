import 'package:ecommerce/features/wishlist/domin/entities/get_product_from_wishlist/get_product_from_wishlist_response.dart';
import 'package:ecommerce/features/wishlist/domin/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductFromWishlistUseCase {
  WishlistRepository wishlistRepository;
  GetProductFromWishlistUseCase({required this.wishlistRepository});
  Future<GetProductFromWishlistResponse> invoke() {
    return wishlistRepository.getProductFromWishlist();
  }
}
