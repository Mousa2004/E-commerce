// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_paymant_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenPaymantRequestDto _$AuthTokenPaymantRequestDtoFromJson(
  Map<String, dynamic> json,
) => AuthTokenPaymantRequestDto(
  apiKey: json['api_key'] as String? ?? ApiEndpoints.apiKeyPayment,
);

Map<String, dynamic> _$AuthTokenPaymantRequestDtoToJson(
  AuthTokenPaymantRequestDto instance,
) => <String, dynamic>{'api_key': instance.apiKey};
