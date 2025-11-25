import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart_response.dart';
import 'package:ecommerce/features/cart/domin/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUseCase {
  CartRepository cartRepository;
  GetCartUseCase({required this.cartRepository});
  Future<GetCartResponse> invoke() {
    return cartRepository.getCart();
  }
}
