import 'package:ecommerce/features/paymant/domin/entities/auth_token_paymant/request/auth_token_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/auth_token_paymant/response/auth_token_paymant_response.dart';
import 'package:ecommerce/features/paymant/domin/repositories/payment_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthTokenPaymentUseCase {
  PaymentRepository paymentRepository;
  AuthTokenPaymentUseCase({required this.paymentRepository});
  Future<AuthTokenPaymantResponse> invoke({
    required AuthTokenPaymantRequest authTokenPaymantRequest,
  }) {
    return paymentRepository.getAuthTokenPayment(
      authTokenPaymantRequest: authTokenPaymantRequest,
    );
  }
}
