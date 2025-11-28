import 'package:ecommerce/features/wishlist/domin/entities/delete_product_from_wishlist/delete_product_from_wishlist_respose.dart';
import 'package:ecommerce/features/wishlist/domin/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteProductFromWishlstUseCase {
  WishlistRepository wishlistRepository;
  DeleteProductFromWishlstUseCase({required this.wishlistRepository});
  Future<DeleteProductFromWishlistRespose> invoke({String? productId}) {
    return wishlistRepository.deleteProductFromWishlist(productId: productId);
  }
}
