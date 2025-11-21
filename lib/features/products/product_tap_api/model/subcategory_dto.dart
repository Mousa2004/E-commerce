import 'package:ecommerce/features/home_tab/home_tap_api/model/category_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subcategory_dto.g.dart';

@JsonSerializable()
class SubcategoryDto {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? slug;
  CategoryDto? category;

  SubcategoryDto({this.id, this.name, this.slug, this.category});

  factory SubcategoryDto.fromJson(Map<String, dynamic> json) {
    return _$SubcategoryDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubcategoryDtoToJson(this);
}
