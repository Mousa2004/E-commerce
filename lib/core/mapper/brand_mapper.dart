import 'package:ecommerce/features/products/domin/entities/brand.dart';
import 'package:ecommerce/features/products/product_tap_api/model/brand_dto.dart';

extension BrandMapper on BrandDto {
  Brand convertToBrand() {
    return Brand(id: id, image: image, name: name, slug: slug);
  }
}
