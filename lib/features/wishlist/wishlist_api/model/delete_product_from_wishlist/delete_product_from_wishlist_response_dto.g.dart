// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_product_from_wishlist_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteProductFromWishlistResponseDto
_$DeleteProductFromWishlistResponseDtoFromJson(Map<String, dynamic> json) =>
    DeleteProductFromWishlistResponseDto(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DeleteProductFromWishlistResponseDtoToJson(
  DeleteProductFromWishlistResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
