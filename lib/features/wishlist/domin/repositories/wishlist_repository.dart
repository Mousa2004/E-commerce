import 'package:ecommerce/features/wishlist/domin/entities/add_product_to_wishlist_response.dart';

abstract class WishlistRepository {
  Future<AddProductToWishlistResponse> addProductToWishlist({
    String? productId,
  });
}
