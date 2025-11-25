import 'package:ecommerce/features/products/product_tap_api/model/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cart_product_dto.g.dart';

@JsonSerializable()
class GetCartProductDto {
  int? count;
  @JsonKey(name: '_id')
  String? id;
  ProductDto? product;
  int? price;

  GetCartProductDto({this.count, this.id, this.product, this.price});

  factory GetCartProductDto.fromJson(Map<String, dynamic> json) {
    return _$GetCartProductDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCartProductDtoToJson(this);
}
