import 'package:ecommerce/features/paymant/paymant_api/model/request_token_paymant_response_dto/request/billing_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_token_paymant_request_dto.g.dart';

@JsonSerializable()
class RequestTokenPaymantRequestDto {
  @JsonKey(name: 'auth_token')
  String? authToken;
  @JsonKey(name: 'amount_cents')
  String? amountCents;
  int? expiration;
  @JsonKey(name: 'order_id')
  String? orderId;
  @JsonKey(name: 'billing_data')
  BillingDataDto? billingData;
  String? currency;
  @JsonKey(name: 'integration_id')
  int? integrationId;

  RequestTokenPaymantRequestDto({
    this.authToken,
    this.amountCents,
    this.expiration = 3600,
    this.orderId,
    this.billingData,
    this.currency = "EGP",
    this.integrationId = 5422260,
  });

  factory RequestTokenPaymantRequestDto.fromJson(Map<String, dynamic> json) {
    return _$RequestTokenPaymantRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RequestTokenPaymantRequestDtoToJson(this);
}
