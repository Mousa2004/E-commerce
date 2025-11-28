import 'package:ecommerce/features/wishlist/domin/entities/add_product_to_wishlist/add_product_to_wishlist_response.dart';
import 'package:ecommerce/features/wishlist/domin/entities/delete_product_from_wishlist/delete_product_from_wishlist_respose.dart';
import 'package:ecommerce/features/wishlist/domin/entities/get_product_from_wishlist/get_product_from_wishlist_response.dart';

abstract class WishlistRepository {
  Future<AddProductToWishlistResponse> addProductToWishlist({
    String? productId,
  });

  Future<GetProductFromWishlistResponse> getProductFromWishlist();

  Future<DeleteProductFromWishlistRespose> deleteProductFromWishlist({
    String? productId,
  });
}
