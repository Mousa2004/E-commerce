import 'package:ecommerce/core/mapper/billing_data_mapper.dart';
import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/request/request_token_paymant_request.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/request_token_paymant_response_dto/request/request_token_paymant_request_dto.dart';

extension RequestTokenPaymentRequestMapper on RequestTokenPaymantRequest {
  RequestTokenPaymantRequestDto convertToRequestTokenPaymantRequestDto() {
    return RequestTokenPaymantRequestDto(
      amountCents: amountCents,
      authToken: authToken,
      billingData: billingData!.convertToBillingDataDto(),
      currency: currency,
      expiration: expiration,
      integrationId: integrationId,
      orderId: orderId,
    );
  }
}
