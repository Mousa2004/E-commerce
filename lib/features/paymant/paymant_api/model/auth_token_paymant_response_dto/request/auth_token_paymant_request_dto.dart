import 'package:ecommerce/core/endpoints/api_endpoints.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_token_paymant_request_dto.g.dart';

@JsonSerializable()
class AuthTokenPaymantRequestDto {
  @JsonKey(name: 'api_key')
  String apiKey;

  AuthTokenPaymantRequestDto({this.apiKey = ApiEndpoints.apiKeyPayment});

  factory AuthTokenPaymantRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AuthTokenPaymantRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthTokenPaymantRequestDtoToJson(this);
}
