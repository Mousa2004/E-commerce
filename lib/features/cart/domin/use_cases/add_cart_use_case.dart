import 'package:ecommerce/features/cart/domin/entities/add_cart/add_cart_response.dart';
import 'package:ecommerce/features/cart/domin/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCartUseCase {
  CartRepository cartRepository;
  AddCartUseCase({required this.cartRepository});
  Future<AddCartResponse> invoke(String productId) {
    return cartRepository.addCart(productId);
  }
}
