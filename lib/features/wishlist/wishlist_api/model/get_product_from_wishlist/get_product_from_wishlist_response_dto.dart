import 'package:ecommerce/features/products/product_tap_api/model/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_product_from_wishlist_response_dto.g.dart';

@JsonSerializable()
class GetProductFromWishlistResponseDto {
  String? status;
  int? count;
  List<ProductDto>? data;

  GetProductFromWishlistResponseDto({this.status, this.count, this.data});

  factory GetProductFromWishlistResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GetProductFromWishlistResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetProductFromWishlistResponseDtoToJson(this);
  }
}
