import 'package:ecommerce/features/home_tab/home_tap_api/model/category/metadata_dto.dart';
import 'package:ecommerce/features/products/product_tap_api/model/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_response_dto.g.dart';

@JsonSerializable()
class ProductResponseDto {
  int? results;
  MetadataDto? metadata;
  @JsonKey(name: 'data')
  List<ProductDto>? product;

  ProductResponseDto({this.results, this.metadata, this.product});

  factory ProductResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ProductResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductResponseDtoToJson(this);
}
