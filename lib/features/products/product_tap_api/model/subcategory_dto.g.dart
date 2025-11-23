// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubcategoryDto _$SubcategoryDtoFromJson(Map<String, dynamic> json) =>
    SubcategoryDto(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      category: SubcategoryDto._categoryFromJson(json['category']),
    );

Map<String, dynamic> _$SubcategoryDtoToJson(SubcategoryDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'category': SubcategoryDto._categoryToJson(instance.category),
    };
