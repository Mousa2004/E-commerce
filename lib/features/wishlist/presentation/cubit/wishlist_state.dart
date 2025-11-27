import 'package:ecommerce/features/wishlist/domin/entities/add_product_to_wishlist_response.dart';

sealed class WishlistState {}

class InitialWishlistState extends WishlistState {}

class AddLoadingWishlistState extends WishlistState {}

class AddSuccessWishlistState extends WishlistState {
  AddProductToWishlistResponse addProductToWishlistResponse;
  AddSuccessWishlistState({required this.addProductToWishlistResponse});
}

class AddErrorWishlistState extends WishlistState {
  String message;
  AddErrorWishlistState({required this.message});
}
