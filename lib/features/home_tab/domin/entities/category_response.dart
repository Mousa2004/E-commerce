import 'package:ecommerce/features/home_tab/domin/entities/category.dart';
import 'package:ecommerce/features/home_tab/domin/entities/metadata.dart';

class CategoryResponse {
  int? results;
  Metadata? metadata;
  List<Category>? categoryDto;

  CategoryResponse({this.results, this.metadata, this.categoryDto});
}
