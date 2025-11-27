import 'package:json_annotation/json_annotation.dart';

part 'add_product_to_wishlist_response_dto.g.dart';

@JsonSerializable()
class AddProductToWishlistResponseDto {
  String? status;
  String? message;
  List<String>? data;

  AddProductToWishlistResponseDto({this.status, this.message, this.data});

  factory AddProductToWishlistResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddProductToWishlistResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddProductToWishlistResponseDtoToJson(this);
  }
}
