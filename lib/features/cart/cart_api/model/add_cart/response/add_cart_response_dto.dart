import 'package:ecommerce/features/cart/cart_api/model/add_cart/response/add_cart_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_cart_response_dto.g.dart';

@JsonSerializable()
class AddCartResponseDto {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  AddCartDto? data;

  AddCartResponseDto({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory AddCartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddCartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddCartResponseDtoToJson(this);
}
