import 'package:ecommerce/core/mapper/brand_mapper.dart';
import 'package:ecommerce/core/mapper/category_mapper.dart';
import 'package:ecommerce/core/mapper/subcategory_mapper.dart';
import 'package:ecommerce/features/products/domin/entities/product.dart';
import 'package:ecommerce/features/products/product_tap_api/model/product_dto.dart';

extension ProductMapper on ProductDto {
  Product convertToProduct() {
    return Product(
      availableColors: availableColors,
      category: category?.convertToCategory(),
      brand: brand?.convertToBrand(),
      description: description,
      createdAt: createdAt,
      id: id,
      imageCover: imageCover,
      images: images,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      slug: slug,
      sold: sold,
      title: title,
      updatedAt: updatedAt,
      subcategory: subcategory
          ?.map((subcategory) => subcategory.convertToSubcategory())
          .toList(),
    );
  }
}
