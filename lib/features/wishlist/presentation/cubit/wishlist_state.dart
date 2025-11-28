import 'package:ecommerce/features/wishlist/domin/entities/add_product_to_wishlist/add_product_to_wishlist_response.dart';
import 'package:ecommerce/features/wishlist/domin/entities/delete_product_from_wishlist/delete_product_from_wishlist_respose.dart';
import 'package:ecommerce/features/wishlist/domin/entities/get_product_from_wishlist/get_product_from_wishlist_response.dart';

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

class GetLoadingWishlistState extends WishlistState {}

class GetSuccessWishlistState extends WishlistState {
  GetProductFromWishlistResponse getProductFromWishlistResponse;
  GetSuccessWishlistState({required this.getProductFromWishlistResponse});
}

class GetErrorWishlistState extends WishlistState {
  String message;
  GetErrorWishlistState({required this.message});
}

class DeleteLoadingWishlistState extends WishlistState {}

class DeleteSuccessWishlistState extends WishlistState {
  DeleteProductFromWishlistRespose deleteProductFromWishlistRespose;
  DeleteSuccessWishlistState({required this.deleteProductFromWishlistRespose});
}

class DeleteErrorWishlistState extends WishlistState {
  String message;
  DeleteErrorWishlistState({required this.message});
}
