import 'package:ecommerce/features/home_tab/domin/entities/brand.dart';
import 'package:ecommerce/features/home_tab/domin/entities/category.dart';

abstract class HomeTapRemoteDataSources {
  Future<List<Category>?> getAllCategories();
  Future<List<Brand>?> getAllBrands();
}
