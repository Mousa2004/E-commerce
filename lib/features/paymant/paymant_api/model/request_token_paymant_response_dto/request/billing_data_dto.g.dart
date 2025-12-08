// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingDataDto _$BillingDataDtoFromJson(Map<String, dynamic> json) =>
    BillingDataDto(
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      street: json['street'] as String?,
      building: json['building'] as String? ?? "NA",
      floor: json['floor'] as String? ?? "NA",
      apartment: json['apartment'] as String? ?? "NA",
      city: json['city'] as String?,
      country: json['country'] as String? ?? "NA",
    );

Map<String, dynamic> _$BillingDataDtoToJson(BillingDataDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'street': instance.street,
      'building': instance.building,
      'floor': instance.floor,
      'apartment': instance.apartment,
      'city': instance.city,
      'country': instance.country,
    };
