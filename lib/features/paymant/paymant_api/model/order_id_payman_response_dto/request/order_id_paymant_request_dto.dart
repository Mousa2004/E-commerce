import 'package:ecommerce/features/paymant/paymant_api/model/order_id_payman_response_dto/request/item_order_id_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_id_paymant_request_dto.g.dart';

@JsonSerializable()
class OrderIdPaymantRequestDto {
  @JsonKey(name: 'auth_token')
  String? authToken;
  @JsonKey(name: 'delivery_needed')
  String? deliveryNeeded;
  @JsonKey(name: 'amount_cents')
  String? amountCents;
  String? currency;
  List<ItemOrderIdDto>? items;

  OrderIdPaymantRequestDto({
    this.authToken,
    this.deliveryNeeded,
    this.amountCents,
    this.currency,
    this.items,
  });

  factory OrderIdPaymantRequestDto.fromJson(Map<String, dynamic> json) {
    return _$OrderIdPaymantRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderIdPaymantRequestDtoToJson(this);
}
