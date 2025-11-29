import 'package:ecommerce/features/subCategories/domin/entities/subcategories_response.dart';

abstract class SubcategoriesRepository {
  Future<SubcategoriesResponse> getSubcategories({String? categoryId});
}
