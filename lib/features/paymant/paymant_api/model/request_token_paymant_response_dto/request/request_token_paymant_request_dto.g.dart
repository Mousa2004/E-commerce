// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_token_paymant_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestTokenPaymantRequestDto _$RequestTokenPaymantRequestDtoFromJson(
  Map<String, dynamic> json,
) => RequestTokenPaymantRequestDto(
  authToken: json['auth_token'] as String?,
  amountCents: json['amount_cents'] as String?,
  expiration: (json['expiration'] as num?)?.toInt() ?? 3600,
  orderId: json['order_id'] as String?,
  billingData: json['billing_data'] == null
      ? null
      : BillingDataDto.fromJson(json['billing_data'] as Map<String, dynamic>),
  currency: json['currency'] as String? ?? "EGP",
  integrationId: (json['integration_id'] as num?)?.toInt() ?? 5422260,
);

Map<String, dynamic> _$RequestTokenPaymantRequestDtoToJson(
  RequestTokenPaymantRequestDto instance,
) => <String, dynamic>{
  'auth_token': instance.authToken,
  'amount_cents': instance.amountCents,
  'expiration': instance.expiration,
  'order_id': instance.orderId,
  'billing_data': instance.billingData,
  'currency': instance.currency,
  'integration_id': instance.integrationId,
};
