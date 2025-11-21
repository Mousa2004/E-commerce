// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponseDto _$ProductResponseDtoFromJson(Map<String, dynamic> json) =>
    ProductResponseDto(
      results: (json['results'] as num?)?.toInt(),
      metadata: json['metadata'] == null
          ? null
          : MetadataDto.fromJson(
              json['metadata'] is Map<String, dynamic> ? json['metadata'] : {},
            ),
      product: (json['data'] as List<dynamic>?)
          ?.map(
            (e) => e is Map<String, dynamic> ? ProductDto.fromJson(e) : null,
          ) // لو مش Map نرجع null
          .whereType<ProductDto>() // نتجاهل null
          .toList(),
    );

Map<String, dynamic> _$ProductResponseDtoToJson(ProductResponseDto instance) =>
    <String, dynamic>{
      'results': instance.results,
      'metadata': instance.metadata,
      'data': instance.product,
    };
