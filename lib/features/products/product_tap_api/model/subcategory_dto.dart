import 'package:ecommerce/features/home_tab/home_tap_api/model/category/category_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subcategory_dto.g.dart';

@JsonSerializable()
class SubcategoryDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;

  @JsonKey(fromJson: _categoryFromJson, toJson: _categoryToJson)
  final CategoryDto? category;

  SubcategoryDto({this.id, this.name, this.slug, this.category});

  factory SubcategoryDto.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubcategoryDtoToJson(this);

  static CategoryDto? _categoryFromJson(dynamic value) {
    if (value == null) return null;

    if (value is String) {
      return CategoryDto(id: value);
    }

    if (value is Map<String, dynamic>) {
      return CategoryDto.fromJson(value);
    }

    return null;
  }

  static dynamic _categoryToJson(CategoryDto? value) {
    if (value == null) return null;
    return value.toJson();
  }
}
