import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/response/request_token_paymant_response.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/request_token_paymant_response_dto/response/request_token_paymant_response_dto.dart';

extension RequestTokenPaymentResponseMapper on RequestTokenPaymantResponseDto {
  RequestTokenPaymantResponse convertToRequestTokenPaymantResponse() {
    return RequestTokenPaymantResponse(token: token);
  }
}
