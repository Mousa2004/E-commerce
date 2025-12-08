import 'package:ecommerce/features/paymant/paymant_api/model/order_id_payman_response_dto/response/merchant_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_id_payman_response_dto.g.dart';

@JsonSerializable()
class OrderIdPaymanResponseDto {
  int? id;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'delivery_needed')
  bool? deliveryNeeded;
  MerchantDto? merchant;
  dynamic collector;
  @JsonKey(name: 'amount_cents')
  int? amountCents;
  @JsonKey(name: 'shipping_data')
  dynamic shippingData;
  String? currency;
  @JsonKey(name: 'is_payment_locked')
  bool? isPaymentLocked;
  @JsonKey(name: 'is_return')
  bool? isReturn;
  @JsonKey(name: 'is_cancel')
  bool? isCancel;
  @JsonKey(name: 'is_returned')
  bool? isReturned;
  @JsonKey(name: 'is_canceled')
  bool? isCanceled;
  @JsonKey(name: 'merchant_order_id')
  dynamic merchantOrderId;
  @JsonKey(name: 'wallet_notification')
  dynamic walletNotification;
  @JsonKey(name: 'paid_amount_cents')
  int? paidAmountCents;
  @JsonKey(name: 'notify_user_with_email')
  bool? notifyUserWithEmail;
  List<dynamic>? items;
  @JsonKey(name: 'order_url')
  String? orderUrl;
  @JsonKey(name: 'commission_fees')
  int? commissionFees;
  @JsonKey(name: 'delivery_fees_cents')
  int? deliveryFeesCents;
  @JsonKey(name: 'delivery_vat_cents')
  int? deliveryVatCents;
  @JsonKey(name: 'payment_method')
  String? paymentMethod;
  @JsonKey(name: 'merchant_staff_tag')
  dynamic merchantStaffTag;
  @JsonKey(name: 'api_source')
  String? apiSource;
  @JsonKey(name: 'payment_status')
  String? paymentStatus;
  @JsonKey(name: 'terminal_version')
  dynamic terminalVersion;
  String? token;
  String? url;

  OrderIdPaymanResponseDto({
    this.id,
    this.createdAt,
    this.deliveryNeeded,
    this.merchant,
    this.collector,
    this.amountCents,
    this.shippingData,
    this.currency,
    this.isPaymentLocked,
    this.isReturn,
    this.isCancel,
    this.isReturned,
    this.isCanceled,
    this.merchantOrderId,
    this.walletNotification,
    this.paidAmountCents,
    this.notifyUserWithEmail,
    this.items,
    this.orderUrl,
    this.commissionFees,
    this.deliveryFeesCents,
    this.deliveryVatCents,
    this.paymentMethod,
    this.merchantStaffTag,
    this.apiSource,
    this.paymentStatus,
    this.terminalVersion,
    this.token,
    this.url,
  });

  factory OrderIdPaymanResponseDto.fromJson(Map<String, dynamic> json) {
    return _$OrderIdPaymanResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderIdPaymanResponseDtoToJson(this);
}
