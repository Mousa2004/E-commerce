import 'package:ecommerce/features/subCategories/domin/entities/subcategories_response.dart';

abstract class SubcategoriesRemoteDateSources {
  Future<SubcategoriesResponse> getSubcategories({String? categoryId});
}
