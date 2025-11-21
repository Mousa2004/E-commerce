import 'package:ecommerce/core/mapper/category_mapper.dart';
import 'package:ecommerce/features/products/domin/entities/subcategory.dart';
import 'package:ecommerce/features/products/product_tap_api/model/subcategory_dto.dart';

extension SubcategoryMapper on SubcategoryDto {
  Subcategory convertToSubcategory() {
    return Subcategory(
      category: category?.convertToCategory(),
      id: id,
      name: name,
      slug: slug,
    );
  }
}
