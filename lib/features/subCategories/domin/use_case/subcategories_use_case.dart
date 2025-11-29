import 'package:ecommerce/features/subCategories/domin/entities/subcategories_response.dart';
import 'package:ecommerce/features/subCategories/domin/repositories/subcategories_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubcategoriesUseCase {
  SubcategoriesRepository subcategoriesRepository;
  SubcategoriesUseCase({required this.subcategoriesRepository});
  Future<SubcategoriesResponse> invoke({String? categoryId}) {
    return subcategoriesRepository.getSubcategories(categoryId: categoryId);
  }
}
