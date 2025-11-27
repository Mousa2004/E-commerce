import 'package:ecommerce/features/wishlist/domin/entities/add_product_to_wishlist/add_product_to_wishlist_response.dart';
import 'package:ecommerce/features/wishlist/wishlist_api/model/add_product_to_wishlist/add_product_to_wishlist_response_dto.dart';

extension AddProductToWishlistMapper on AddProductToWishlistResponseDto {
  AddProductToWishlistResponse convertToAddProductToWishlistResponse() {
    return AddProductToWishlistResponse(
      status: status,
      message: message,
      data: data,
    );
  }
}
