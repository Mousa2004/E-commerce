import 'package:ecommerce/features/subCategories/data/data_sources/remote/subcategories_remote_date_sources.dart';
import 'package:ecommerce/features/subCategories/domin/entities/subcategories_response.dart';
import 'package:ecommerce/features/subCategories/domin/repositories/subcategories_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubcategoriesRepository)
class SubcategoriesRepositoryImpl implements SubcategoriesRepository {
  SubcategoriesRemoteDateSources subcategoriesRemoteDateSources;
  SubcategoriesRepositoryImpl({required this.subcategoriesRemoteDateSources});
  @override
  Future<SubcategoriesResponse> getSubcategories({String? categoryId}) {
    return subcategoriesRemoteDateSources.getSubcategories(
      categoryId: categoryId,
    );
  }
}
