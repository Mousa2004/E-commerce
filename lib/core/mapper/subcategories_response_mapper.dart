import 'package:ecommerce/core/mapper/subcategory_mapper.dart';
import 'package:ecommerce/features/subCategories/domin/entities/subcategories_response.dart';
import 'package:ecommerce/features/subCategories/subCtegories_api/model/subcategories_response_dto.dart';

extension SubcategoriesResponseMapper on SubcategoriesResponseDto {
  SubcategoriesResponse convertToSubcategoriesResponse() {
    return SubcategoriesResponse(
      results: results,
      data: data!
          .map((subcategoriesDto) => subcategoriesDto.convertToSubcategory())
          .toList(),
    );
  }
}
