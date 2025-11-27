// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_from_wishlist_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductFromWishlistResponseDto _$GetProductFromWishlistResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetProductFromWishlistResponseDto(
  status: json['status'] as String?,
  count: (json['count'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetProductFromWishlistResponseDtoToJson(
  GetProductFromWishlistResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'count': instance.count,
  'data': instance.data,
};
