// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_to_wishlist_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductToWishlistResponseDto _$AddProductToWishlistResponseDtoFromJson(
  Map<String, dynamic> json,
) => AddProductToWishlistResponseDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$AddProductToWishlistResponseDtoToJson(
  AddProductToWishlistResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
