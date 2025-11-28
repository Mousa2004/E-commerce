import 'package:ecommerce/features/wishlist/domin/entities/delete_product_from_wishlist/delete_product_from_wishlist_respose.dart';
import 'package:ecommerce/features/wishlist/wishlist_api/model/delete_product_from_wishlist/delete_product_from_wishlist_response_dto.dart';

extension DeleteProductFromWishlistMapper
    on DeleteProductFromWishlistResponseDto {
  DeleteProductFromWishlistRespose convertToDeleteProductFromWishlistRespose() {
    return DeleteProductFromWishlistRespose(
      message: message,
      status: status,
      data: data,
    );
  }
}
