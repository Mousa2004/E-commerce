import 'package:json_annotation/json_annotation.dart';

import 'package:ecommerce/features/home_tab/home_tap_api/model/category/category_dto.dart';
import 'package:ecommerce/features/home_tab/home_tap_api/model/category/metadata_dto.dart';

part 'category_response_dto.g.dart';

@JsonSerializable()
class CategoryResponseDto {
  int? results;
  MetadataDto? metadata;
  @JsonKey(name: 'data')
  List<CategoryDto>? categoryDto;

  CategoryResponseDto({this.results, this.metadata, this.categoryDto});

  factory CategoryResponseDto.fromJson(Map<String, dynamic> json) {
    return _$CategoryResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryResponseDtoToJson(this);
}
