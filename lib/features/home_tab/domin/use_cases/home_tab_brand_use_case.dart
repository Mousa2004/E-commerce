import 'package:ecommerce/features/home_tab/domin/entities/brand.dart';
import 'package:ecommerce/features/home_tab/domin/repositories/home_tab_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabBrandUseCase {
  HomeTabRepository homeTabRepository;
  HomeTabBrandUseCase({required this.homeTabRepository});

  Future<List<Brand>?> invoke() {
    return homeTabRepository.getAllBrands();
  }
}
