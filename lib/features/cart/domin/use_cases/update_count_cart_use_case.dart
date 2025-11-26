import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart_response.dart';
import 'package:ecommerce/features/cart/domin/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCountCartUseCase {
  CartRepository cartRepository;
  UpdateCountCartUseCase({required this.cartRepository});
  Future<GetCartResponse> invoke(String productId, int count) {
    return cartRepository.updateCountCart(productId, count);
  }
}
