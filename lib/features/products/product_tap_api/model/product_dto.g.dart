// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
  sold: (json['sold'] as num?)?.toInt(),
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  subcategory: (json['subcategory'] as List<dynamic>?)
      ?.whereType<Map<String, dynamic>>() // يتأكد من النوع
      .map((e) => SubcategoryDto.fromJson(e))
      .toList(),
  ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt(),
  id: json['_id'] as String?,
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toInt(),
  imageCover: json['imageCover'] as String?,
  category: json['category'] is Map<String, dynamic>
      ? CategoryDto.fromJson(json['category'])
      : null,
  brand: json['brand'] is Map<String, dynamic>
      ? BrandDto.fromJson(json['brand'])
      : null,
  ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toInt(),
  availableColors: json['availableColors'] as List<dynamic>?,
);

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'sold': instance.sold,
      'images': instance.images,
      'subcategory': instance.subcategory,
      'ratingsQuantity': instance.ratingsQuantity,
      '_id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'quantity': instance.quantity,
      'price': instance.price,
      'imageCover': instance.imageCover,
      'category': instance.category,
      'brand': instance.brand,
      'ratingsAverage': instance.ratingsAverage,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'priceAfterDiscount': instance.priceAfterDiscount,
      'availableColors': instance.availableColors,
    };
