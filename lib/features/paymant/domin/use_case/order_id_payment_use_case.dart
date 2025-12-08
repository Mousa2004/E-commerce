import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/request/order_id_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/response/order_id_paymant_response.dart';
import 'package:ecommerce/features/paymant/domin/repositories/payment_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrderIdPaymentUseCase {
  PaymentRepository paymentRepository;
  OrderIdPaymentUseCase({required this.paymentRepository});
  Future<OrderIdPaymantResponse> invoke({
    required OrderIdPaymantRequest orderIdPaymantRequest,
  }) {
    return paymentRepository.getOrderIdTokenPayment(
      orderIdPaymantRequest: orderIdPaymantRequest,
    );
  }
}
