import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart_response.dart';
import 'package:ecommerce/features/cart/domin/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteCartUseCase {
  CartRepository cartRepository;
  DeleteCartUseCase({required this.cartRepository});
  Future<GetCartResponse> invoke(String productId) {
    return cartRepository.deleteCart(productId);
  }
}
