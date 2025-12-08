import 'package:json_annotation/json_annotation.dart';

part 'auth_token_paymant_response_dto.g.dart';

@JsonSerializable()
class AuthTokenPaymantResponseDto {
  String? token;

  AuthTokenPaymantResponseDto({this.token});

  factory AuthTokenPaymantResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AuthTokenPaymantResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthTokenPaymantResponseDtoToJson(this);
}
