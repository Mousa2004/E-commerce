import 'package:ecommerce/features/cart/domin/entities/add_cart/add_cart_response.dart';
import 'package:ecommerce/features/cart/domin/repositories/add_cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCartUseCase {
  AddCartRepository addCartRepository;
  AddCartUseCase({required this.addCartRepository});
  Future<AddCartResponse> invoke(String productId) {
    return addCartRepository.addCart(productId);
  }
}
