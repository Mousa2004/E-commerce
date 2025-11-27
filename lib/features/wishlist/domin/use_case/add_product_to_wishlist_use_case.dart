import 'package:ecommerce/features/wishlist/domin/entities/add_product_to_wishlist_response.dart';
import 'package:ecommerce/features/wishlist/domin/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddProductToWishlistUseCase {
  WishlistRepository wishlistRepository;
  AddProductToWishlistUseCase({required this.wishlistRepository});
  Future<AddProductToWishlistResponse> invoke({String? productId}) {
    return wishlistRepository.addProductToWishlist(productId: productId);
  }
}
