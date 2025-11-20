import 'package:ecommerce/features/home_tab/domin/entities/category.dart';

abstract class HomeTabRepository {
  Future<List<Category>?> getAllCategories();
}
