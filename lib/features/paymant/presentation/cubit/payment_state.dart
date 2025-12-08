import 'package:ecommerce/features/paymant/domin/entities/auth_token_paymant/response/auth_token_paymant_response.dart';
import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/response/order_id_paymant_response.dart';

sealed class PaymentState {}

class PaymentInitialState extends PaymentState {}

class AuthTokenPaymentLoadingState extends PaymentState {}

class AuthTokenPaymentSuccessState extends PaymentState {
  AuthTokenPaymantResponse authTokenPaymantResponse;
  AuthTokenPaymentSuccessState({required this.authTokenPaymantResponse});
}

class AuthTokenPaymentErrorrState extends PaymentState {
  String message;
  AuthTokenPaymentErrorrState({required this.message});
}

//==============//
class OrderIdPaymentLoadingState extends PaymentState {}

class OrderIdPaymentSuccessState extends PaymentState {
  OrderIdPaymantResponse orderIdPaymantResponse;
  OrderIdPaymentSuccessState({required this.orderIdPaymantResponse});
}

class OrderIdPaymentErrorrState extends PaymentState {
  String message;
  OrderIdPaymentErrorrState({required this.message});
}

//===========//
class RequestTokenPaymentLoadingState extends PaymentState {}

class RequestTokenPaymentSuccessState extends PaymentState {
  String token;
  RequestTokenPaymentSuccessState({required this.token});
}

class RequestTokenPaymentErrorrState extends PaymentState {
  String message;
  RequestTokenPaymentErrorrState({required this.message});
}
