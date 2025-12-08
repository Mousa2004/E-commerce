import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/request/billing_data.dart';

class RequestTokenPaymantRequest {
  String? authToken;

  String? amountCents;
  int? expiration;

  String? orderId;

  BillingData? billingData;
  String? currency;
  int? integrationId;

  RequestTokenPaymantRequest({
    this.authToken,
    this.amountCents,
    this.expiration = 3600,
    this.orderId,
    this.billingData,
    this.currency = "EGP",
    this.integrationId = 5422260,
  });
}
