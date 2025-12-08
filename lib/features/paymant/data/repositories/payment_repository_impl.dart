import 'package:ecommerce/features/paymant/data/data_sources/remote/payment_remote_data_sources.dart';
import 'package:ecommerce/features/paymant/domin/entities/auth_token_paymant/request/auth_token_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/auth_token_paymant/response/auth_token_paymant_response.dart';
import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/request/order_id_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/response/order_id_paymant_response.dart';
import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/request/request_token_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/response/request_token_paymant_response.dart';
import 'package:ecommerce/features/paymant/domin/repositories/payment_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentRepository)
class PaymentRepositoryImpl implements PaymentRepository {
  PaymentRemoteDataSources paymentRemoteDataSources;
  PaymentRepositoryImpl({required this.paymentRemoteDataSources});
  @override
  Future<AuthTokenPaymantResponse> getAuthTokenPayment({
    required AuthTokenPaymantRequest authTokenPaymantRequest,
  }) {
    return paymentRemoteDataSources.getAuthTokenPayment(
      authTokenPaymantRequest: authTokenPaymantRequest,
    );
  }

  @override
  Future<OrderIdPaymantResponse> getOrderIdTokenPayment({
    required OrderIdPaymantRequest orderIdPaymantRequest,
  }) {
    return paymentRemoteDataSources.getOrderIdTokenPayment(
      orderIdPaymantRequest: orderIdPaymantRequest,
    );
  }

  @override
  Future<RequestTokenPaymantResponse> getRequestTokenPayment({
    required RequestTokenPaymantRequest requestTokenPaymantRequest,
  }) {
    return paymentRemoteDataSources.getRequestTokenPayment(
      requestTokenPaymantRequest: requestTokenPaymantRequest,
    );
  }
}
