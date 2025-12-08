import 'package:json_annotation/json_annotation.dart';

part 'item_order_id_dto.g.dart';

@JsonSerializable()
class ItemOrderIdDto {
  String? name;
  @JsonKey(name: 'amount_cents')
  String? amountCents;
  String? description;
  String? quantity;

  ItemOrderIdDto({
    this.name,
    this.amountCents,
    this.description,
    this.quantity,
  });

  factory ItemOrderIdDto.fromJson(Map<String, dynamic> json) {
    return _$ItemOrderIdDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ItemOrderIdDtoToJson(this);
}
