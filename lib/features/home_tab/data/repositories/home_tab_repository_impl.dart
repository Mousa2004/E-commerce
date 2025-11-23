import 'package:ecommerce/features/home_tab/data/data_sources/remote/home_tap_remote_data_sources.dart';
import 'package:ecommerce/features/home_tab/domin/entities/brand.dart';
import 'package:ecommerce/features/home_tab/domin/entities/category.dart';
import 'package:ecommerce/features/home_tab/domin/repositories/home_tab_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeTabRepository)
class HomeTabRepositoryImpl implements HomeTabRepository {
  HomeTapRemoteDataSources homeTapRemoteDataSources;
  HomeTabRepositoryImpl({required this.homeTapRemoteDataSources});
  @override
  Future<List<Category>?> getAllCategories() {
    return homeTapRemoteDataSources.getAllCategories();
  }

  @override
  Future<List<Brand>?> getAllBrands() {
    return homeTapRemoteDataSources.getAllBrands();
  }
}
