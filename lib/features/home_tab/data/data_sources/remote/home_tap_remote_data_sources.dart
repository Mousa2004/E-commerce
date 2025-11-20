import 'package:ecommerce/features/home_tab/domin/entities/category.dart';

abstract class HomeTapRemoteDataSources {
  Future<List<Category>?> getAllCategories();
}
