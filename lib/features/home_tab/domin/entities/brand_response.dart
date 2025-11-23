import 'package:ecommerce/features/home_tab/domin/entities/brand.dart';
import 'package:ecommerce/features/home_tab/domin/entities/metadata.dart';

class BrandResponse {
  int? results;
  Metadata? metadata;

  List<Brand>? brand;

  BrandResponse({this.results, this.metadata, this.brand});
}
