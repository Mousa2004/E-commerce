import 'package:ecommerce/features/paymant/domin/entities/auth_token_paymant/response/auth_token_paymant_response.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/auth_token_paymant_response_dto/response/auth_token_paymant_response_dto.dart';

extension AuthTokenPaymentResponseMapper on AuthTokenPaymantResponseDto {
  AuthTokenPaymantResponse convertToAuthTokenPaymantResponse() {
    return AuthTokenPaymantResponse(token: token);
  }
}
