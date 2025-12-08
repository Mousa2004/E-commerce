// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantDto _$MerchantDtoFromJson(Map<String, dynamic> json) => MerchantDto(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  phones: (json['phones'] as List<dynamic>?)?.map((e) => e as String).toList(),
  companyEmails: (json['company_emails'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  companyName: json['company_name'] as String?,
  state: json['state'] as String?,
  country: json['country'] as String?,
  city: json['city'] as String?,
  postalCode: json['postal_code'] as String?,
  street: json['street'] as String?,
);

Map<String, dynamic> _$MerchantDtoToJson(MerchantDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'phones': instance.phones,
      'company_emails': instance.companyEmails,
      'company_name': instance.companyName,
      'state': instance.state,
      'country': instance.country,
      'city': instance.city,
      'postal_code': instance.postalCode,
      'street': instance.street,
    };
