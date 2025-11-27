import 'package:ecommerce/core/mapper/product_mapper.dart';
import 'package:ecommerce/features/wishlist/domin/entities/get_product_from_wishlist/get_product_from_wishlist_response.dart';
import 'package:ecommerce/features/wishlist/wishlist_api/model/get_product_from_wishlist/get_product_from_wishlist_response_dto.dart';

extension GetProductFromWishlistResponseMapper
    on GetProductFromWishlistResponseDto {
  GetProductFromWishlistResponse convertToGetProductFromWishlistResponse() {
    return GetProductFromWishlistResponse(
      count: count,
      status: status,
      data: data!.map((productDto) => productDto.convertToProduct()).toList(),
    );
  }
}
