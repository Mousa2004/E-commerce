import 'package:ecommerce/features/paymant/domin/entities/auth_token_paymant/request/auth_token_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/auth_token_paymant/response/auth_token_paymant_response.dart';
import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/request/order_id_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/response/order_id_paymant_response.dart';
import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/request/request_token_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/response/request_token_paymant_response.dart';

abstract class PaymentRemoteDataSources {
  Future<AuthTokenPaymantResponse> getAuthTokenPayment({
    required AuthTokenPaymantRequest authTokenPaymantRequest,
  });

  Future<OrderIdPaymantResponse> getOrderIdTokenPayment({
    required OrderIdPaymantRequest orderIdPaymantRequest,
  });

  Future<RequestTokenPaymantResponse> getRequestTokenPayment({
    required RequestTokenPaymantRequest requestTokenPaymantRequest,
  });
}
