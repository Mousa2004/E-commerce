import 'package:ecommerce/features/home_tab/domin/entities/category.dart';
import 'package:ecommerce/features/home_tab/home_tap_api/model/category_dto.dart';

extension CategoryMapper on CategoryDto {
  Category convertToCategory() {
    return Category(id: id, image: image, name: image, slug: slug);
  }
}
