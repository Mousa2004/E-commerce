import 'package:json_annotation/json_annotation.dart';

part 'delete_product_from_wishlist_response_dto.g.dart';

@JsonSerializable()
class DeleteProductFromWishlistResponseDto {
  String? status;
  String? message;
  List<String>? data;

  DeleteProductFromWishlistResponseDto({this.status, this.message, this.data});

  factory DeleteProductFromWishlistResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$DeleteProductFromWishlistResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteProductFromWishlistResponseDtoToJson(this);
  }
}
