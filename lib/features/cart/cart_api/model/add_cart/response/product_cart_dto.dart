import 'package:json_annotation/json_annotation.dart';

part 'product_cart_dto.g.dart';

@JsonSerializable()
class ProductCartDto {
  int? count;
  @JsonKey(name: '_id')
  String? id;
  String? product;
  int? price;

  ProductCartDto({this.count, this.id, this.product, this.price});

  factory ProductCartDto.fromJson(Map<String, dynamic> json) {
    return _$ProductCartDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductCartDtoToJson(this);
}
