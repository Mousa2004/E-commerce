import 'package:ecommerce/features/home_tab/domin/entities/brand.dart';
import 'package:ecommerce/features/home_tab/home_tap_api/model/brands/brand_dto.dart';

extension BrandMapper on BrandDto {
  Brand convertToBrand() {
    return Brand(id: id, image: image, name: name, slug: slug);
  }
}
