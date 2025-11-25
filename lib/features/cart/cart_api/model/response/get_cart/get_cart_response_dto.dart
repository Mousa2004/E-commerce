import 'package:ecommerce/features/cart/cart_api/model/response/get_cart/get_cart_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cart_response_dto.g.dart';

@JsonSerializable()
class GetCartResponseDto {
  String? status;
  int? numOfCartItems;
  String? cartId;
  GetCartDto? data;

  GetCartResponseDto({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory GetCartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetCartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCartResponseDtoToJson(this);
}
