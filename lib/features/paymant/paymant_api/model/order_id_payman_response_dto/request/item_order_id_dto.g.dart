// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_order_id_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemOrderIdDto _$ItemOrderIdDtoFromJson(Map<String, dynamic> json) =>
    ItemOrderIdDto(
      name: json['name'] as String?,
      amountCents: json['amount_cents'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] as String?,
    );

Map<String, dynamic> _$ItemOrderIdDtoToJson(ItemOrderIdDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount_cents': instance.amountCents,
      'description': instance.description,
      'quantity': instance.quantity,
    };
