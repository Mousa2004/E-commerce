import 'package:ecommerce/features/subCategories/domin/entities/subcategory.dart';
import 'package:ecommerce/features/subCategories/subCtegories_api/model/subcategory_dto.dart';

extension SubcategoryMapper on SubcategoryDto {
  Subcategory convertToSubcategory() {
    return Subcategory(category: category, id: id, name: name, slug: slug);
  }
}
