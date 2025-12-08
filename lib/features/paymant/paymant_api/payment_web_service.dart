import 'package:dio/dio.dart';
import 'package:ecommerce/core/endpoints/api_endpoints.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/auth_token_paymant_response_dto/request/auth_token_paymant_request_dto.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/auth_token_paymant_response_dto/response/auth_token_paymant_response_dto.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/order_id_payman_response_dto/request/order_id_paymant_request_dto.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/order_id_payman_response_dto/response/order_id_payman_response_dto.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/request_token_paymant_response_dto/request/request_token_paymant_request_dto.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/request_token_paymant_response_dto/response/request_token_paymant_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_web_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.apiPaymantBase)
abstract class PaymentWebService {
  factory PaymentWebService(Dio dio, {String? baseUrl}) = _PaymentWebService;

  @POST(ApiEndpoints.apiAuthTokenPaymant)
  Future<AuthTokenPaymantResponseDto> getAuthTokenPaymant(
    @Body() AuthTokenPaymantRequestDto apiKey,
  );

  @POST(ApiEndpoints.apiOrderIdTokenPaymant)
  Future<OrderIdPaymanResponseDto> getOrderIdTokenPaymant(
    @Body() OrderIdPaymantRequestDto orderIdPaymantRequest,
  );

  @POST(ApiEndpoints.apiRequestTokenPaymant)
  Future<RequestTokenPaymantResponseDto> getRequestTokenPaymant(
    @Body() RequestTokenPaymantRequestDto requestTokenPaymantRequest,
  );
}
