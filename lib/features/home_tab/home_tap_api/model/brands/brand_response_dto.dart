import 'package:ecommerce/features/home_tab/home_tap_api/model/brands/brand_dto.dart';
import 'package:ecommerce/features/home_tab/home_tap_api/model/category/metadata_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand_response_dto.g.dart';

@JsonSerializable()
class BrandResponseDto {
  int? results;
  MetadataDto? metadata;
  @JsonKey(name: 'data')
  List<BrandDto>? brandDto;

  BrandResponseDto({this.results, this.metadata, this.brandDto});

  factory BrandResponseDto.fromJson(Map<String, dynamic> json) {
    return _$BrandResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BrandResponseDtoToJson(this);
}
