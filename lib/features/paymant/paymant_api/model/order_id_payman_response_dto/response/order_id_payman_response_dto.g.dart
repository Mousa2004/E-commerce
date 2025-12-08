// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_id_payman_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderIdPaymanResponseDto _$OrderIdPaymanResponseDtoFromJson(
  Map<String, dynamic> json,
) => OrderIdPaymanResponseDto(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  deliveryNeeded: json['delivery_needed'] as bool?,
  merchant: json['merchant'] == null
      ? null
      : MerchantDto.fromJson(json['merchant'] as Map<String, dynamic>),
  collector: json['collector'],
  amountCents: (json['amount_cents'] as num?)?.toInt(),
  shippingData: json['shipping_data'],
  currency: json['currency'] as String?,
  isPaymentLocked: json['is_payment_locked'] as bool?,
  isReturn: json['is_return'] as bool?,
  isCancel: json['is_cancel'] as bool?,
  isReturned: json['is_returned'] as bool?,
  isCanceled: json['is_canceled'] as bool?,
  merchantOrderId: json['merchant_order_id'],
  walletNotification: json['wallet_notification'],
  paidAmountCents: (json['paid_amount_cents'] as num?)?.toInt(),
  notifyUserWithEmail: json['notify_user_with_email'] as bool?,
  items: json['items'] as List<dynamic>?,
  orderUrl: json['order_url'] as String?,
  commissionFees: (json['commission_fees'] as num?)?.toInt(),
  deliveryFeesCents: (json['delivery_fees_cents'] as num?)?.toInt(),
  deliveryVatCents: (json['delivery_vat_cents'] as num?)?.toInt(),
  paymentMethod: json['payment_method'] as String?,
  merchantStaffTag: json['merchant_staff_tag'],
  apiSource: json['api_source'] as String?,
  paymentStatus: json['payment_status'] as String?,
  terminalVersion: json['terminal_version'],
  token: json['token'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$OrderIdPaymanResponseDtoToJson(
  OrderIdPaymanResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt?.toIso8601String(),
  'delivery_needed': instance.deliveryNeeded,
  'merchant': instance.merchant,
  'collector': instance.collector,
  'amount_cents': instance.amountCents,
  'shipping_data': instance.shippingData,
  'currency': instance.currency,
  'is_payment_locked': instance.isPaymentLocked,
  'is_return': instance.isReturn,
  'is_cancel': instance.isCancel,
  'is_returned': instance.isReturned,
  'is_canceled': instance.isCanceled,
  'merchant_order_id': instance.merchantOrderId,
  'wallet_notification': instance.walletNotification,
  'paid_amount_cents': instance.paidAmountCents,
  'notify_user_with_email': instance.notifyUserWithEmail,
  'items': instance.items,
  'order_url': instance.orderUrl,
  'commission_fees': instance.commissionFees,
  'delivery_fees_cents': instance.deliveryFeesCents,
  'delivery_vat_cents': instance.deliveryVatCents,
  'payment_method': instance.paymentMethod,
  'merchant_staff_tag': instance.merchantStaffTag,
  'api_source': instance.apiSource,
  'payment_status': instance.paymentStatus,
  'terminal_version': instance.terminalVersion,
  'token': instance.token,
  'url': instance.url,
};
