// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartProductDto _$GetCartProductDtoFromJson(Map<String, dynamic> json) =>
    GetCartProductDto(
      count: (json['count'] as num?)?.toInt(),
      id: json['_id'] as String?,
      product: json['product'] == null
          ? null
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetCartProductDtoToJson(GetCartProductDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      '_id': instance.id,
      'product': instance.product,
      'price': instance.price,
    };
