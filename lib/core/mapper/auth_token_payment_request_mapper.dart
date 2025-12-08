import 'package:ecommerce/features/paymant/domin/entities/auth_token_paymant/request/auth_token_paymant_request.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/auth_token_paymant_response_dto/request/auth_token_paymant_request_dto.dart';

extension AuthTokenPaymentRequestMapper on AuthTokenPaymantRequest {
  AuthTokenPaymantRequestDto convertToAuthTokenPaymantRequestDto() {
    return AuthTokenPaymantRequestDto(apiKey: apiKey);
  }
}
