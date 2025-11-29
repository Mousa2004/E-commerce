import 'package:ecommerce/features/home_tab/home_tap_api/model/category/metadata_dto.dart';
import 'package:ecommerce/features/subCategories/subCtegories_api/model/subcategory_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subcategories_response_dto.g.dart';

@JsonSerializable()
class SubcategoriesResponseDto {
  int? results;
  MetadataDto? metadata;
  List<SubcategoryDto>? data;

  SubcategoriesResponseDto({this.results, this.metadata, this.data});

  factory SubcategoriesResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SubcategoriesResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubcategoriesResponseDtoToJson(this);
}
