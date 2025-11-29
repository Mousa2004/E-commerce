import 'package:json_annotation/json_annotation.dart';

part 'subcategory_dto.g.dart';

@JsonSerializable()
class SubcategoryDto {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? slug;
  String? category;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubcategoryDto({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  factory SubcategoryDto.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubcategoryDtoToJson(this);
}
