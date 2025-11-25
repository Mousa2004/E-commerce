import 'package:ecommerce/features/cart/cart_api/model/response/get_cart/get_cart_product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cart_dto.g.dart';

@JsonSerializable()
class GetCartDto {
  @JsonKey(name: '_id')
  String? id;
  String? cartOwner;
  List<GetCartProductDto>? products;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  int? totalCartPrice;

  GetCartDto({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory GetCartDto.fromJson(Map<String, dynamic> json) =>
      _$GetCartDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartDtoToJson(this);
}
