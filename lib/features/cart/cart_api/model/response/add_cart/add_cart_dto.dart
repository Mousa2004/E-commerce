import 'package:ecommerce/features/cart/cart_api/model/response/add_cart/product_cart_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_cart_dto.g.dart';

@JsonSerializable()
class AddCartDto {
  @JsonKey(name: '_id')
  String? id;
  String? cartOwner;
  List<ProductCartDto>? products;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  int? totalCartPrice;

  AddCartDto({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory AddCartDto.fromJson(Map<String, dynamic> json) =>
      _$AddCartDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddCartDtoToJson(this);
}
