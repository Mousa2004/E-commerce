import 'package:ecommerce/features/home_tab/domin/entities/metadata.dart';
import 'package:ecommerce/features/subCategories/domin/entities/subcategory.dart';

class SubcategoriesResponse {
  int? results;
  Metadata? metadata;
  List<Subcategory>? data;

  SubcategoriesResponse({this.results, this.metadata, this.data});
}
