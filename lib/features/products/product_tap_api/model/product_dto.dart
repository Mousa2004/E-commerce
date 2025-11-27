import 'package:ecommerce/features/home_tab/home_tap_api/model/brands/brand_dto.dart';
import 'package:ecommerce/features/home_tab/home_tap_api/model/category/category_dto.dart';
import 'package:ecommerce/features/products/product_tap_api/model/subcategory_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto {
  int? sold;
  List<String>? images;
  List<SubcategoryDto>? subcategory;
  int? ratingsQuantity;
  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryDto? category;
  BrandDto? brand;
  double? ratingsAverage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? priceAfterDiscount;
  List<dynamic>? availableColors;

  ProductDto({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.priceAfterDiscount,
    this.availableColors,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    const base = "https://ecommerce.routemisr.com/Route-Academy-products/";

    final dto = _$ProductDtoFromJson(json);

    if (dto.imageCover != null &&
        dto.imageCover!.isNotEmpty &&
        !dto.imageCover!.startsWith("http")) {
      dto.imageCover = "$base${dto.imageCover}";
    }

    if (dto.images != null) {
      dto.images = dto.images!.map((img) {
        if (img.startsWith("http")) return img;
        return "$base$img";
      }).toList();
    }

    return dto;
  }

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
