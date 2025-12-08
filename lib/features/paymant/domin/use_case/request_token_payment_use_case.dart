import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/request/request_token_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/response/request_token_paymant_response.dart';
import 'package:ecommerce/features/paymant/domin/repositories/payment_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RequestTokenPaymentUseCase {
  PaymentRepository paymentRepository;
  RequestTokenPaymentUseCase({required this.paymentRepository});
  Future<RequestTokenPaymantResponse> invoke({
    required RequestTokenPaymantRequest requestTokenPaymantRequest,
  }) {
    return paymentRepository.getRequestTokenPayment(
      requestTokenPaymantRequest: requestTokenPaymantRequest,
    );
  }
}
