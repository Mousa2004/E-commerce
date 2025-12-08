import 'package:dio/dio.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/core/mapper/auth_token_payment_request_mapper.dart';
import 'package:ecommerce/core/mapper/auth_token_payment_response_mapper.dart';
import 'package:ecommerce/core/mapper/order_id_payment_request_mapper.dart';
import 'package:ecommerce/core/mapper/order_id_payment_response_mapper.dart';
import 'package:ecommerce/core/mapper/request_token_payment_request_mapper.dart';
import 'package:ecommerce/core/mapper/request_token_payment_response_mapper.dart';
import 'package:ecommerce/features/paymant/data/data_sources/remote/payment_remote_data_sources.dart';
import 'package:ecommerce/features/paymant/domin/entities/auth_token_paymant/request/auth_token_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/auth_token_paymant/response/auth_token_paymant_response.dart';
import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/request/order_id_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/response/order_id_paymant_response.dart';
import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/request/request_token_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/response/request_token_paymant_response.dart';
import 'package:ecommerce/features/paymant/paymant_api/payment_web_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentRemoteDataSources)
class PaymentRemoteDataSourcesImpl implements PaymentRemoteDataSources {
  PaymentWebService paymentWebService;
  PaymentRemoteDataSourcesImpl({required this.paymentWebService});
  @override
  Future<AuthTokenPaymantResponse> getAuthTokenPayment({
    //todo: AuthTokenPaymantRequest => AuthTokenPaymantRequestDto
    required AuthTokenPaymantRequest authTokenPaymantRequest,
  }) async {
    try {
      final authTokenPaymantResponse = await paymentWebService
          .getAuthTokenPaymant(
            authTokenPaymantRequest.convertToAuthTokenPaymantRequestDto(),
          );

      //todo: AuthTokenPaymantResponseDto => AuthTokenPaymantResponse
      return authTokenPaymantResponse.convertToAuthTokenPaymantResponse();
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<OrderIdPaymantResponse> getOrderIdTokenPayment({
    required OrderIdPaymantRequest orderIdPaymantRequest,
  }) async {
    try {
      //todo:OrderIdPaymantRequest => OrderIdPaymantRequestDto
      final orderIdPaymantResponse = await paymentWebService
          .getOrderIdTokenPaymant(
            orderIdPaymantRequest.convertToOrderIdPaymantRequestDto(),
          );

      //todo: OrderIdPaymanResponseDto => OrderIdPaymanResponse
      return orderIdPaymantResponse.covertToOrderIdPaymantResponse();
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<RequestTokenPaymantResponse> getRequestTokenPayment({
    required RequestTokenPaymantRequest requestTokenPaymantRequest,
  }) async {
    try {
      //todo: RequestTokenPaymantRequest => RequestTokenPaymantRequestDto
      final requestTokenPaymantResponse = await paymentWebService
          .getRequestTokenPaymant(
            requestTokenPaymantRequest.convertToRequestTokenPaymantRequestDto(),
          );
      //todo: RequestTokenPaymantResponseDto => RequestTokenPaymantResponse
      return requestTokenPaymantResponse.convertToRequestTokenPaymantResponse();
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
