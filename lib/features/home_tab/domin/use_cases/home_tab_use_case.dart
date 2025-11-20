import 'package:ecommerce/features/home_tab/domin/entities/category.dart';
import 'package:ecommerce/features/home_tab/domin/repositories/home_tab_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabUseCase {
  HomeTabRepository homeTabRepository;
  HomeTabUseCase({required this.homeTabRepository});

  Future<List<Category>?> invoke() {
    return homeTabRepository.getAllCategories();
  }
}
