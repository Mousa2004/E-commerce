// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategories_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubcategoriesResponseDto _$SubcategoriesResponseDtoFromJson(
  Map<String, dynamic> json,
) => SubcategoriesResponseDto(
  results: (json['results'] as num?)?.toInt(),
  metadata: json['metadata'] == null
      ? null
      : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => SubcategoryDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SubcategoriesResponseDtoToJson(
  SubcategoriesResponseDto instance,
) => <String, dynamic>{
  'results': instance.results,
  'metadata': instance.metadata,
  'data': instance.data,
};
