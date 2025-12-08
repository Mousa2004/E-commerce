// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_id_paymant_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderIdPaymantRequestDto _$OrderIdPaymantRequestDtoFromJson(
  Map<String, dynamic> json,
) => OrderIdPaymantRequestDto(
  authToken: json['auth_token'] as String?,
  deliveryNeeded: json['delivery_needed'] as String?,
  amountCents: json['amount_cents'] as String?,
  currency: json['currency'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => ItemOrderIdDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OrderIdPaymantRequestDtoToJson(
  OrderIdPaymantRequestDto instance,
) => <String, dynamic>{
  'auth_token': instance.authToken,
  'delivery_needed': instance.deliveryNeeded,
  'amount_cents': instance.amountCents,
  'currency': instance.currency,
  'items': instance.items,
};
