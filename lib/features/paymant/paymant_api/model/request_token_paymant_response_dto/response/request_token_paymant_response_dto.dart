import 'package:json_annotation/json_annotation.dart';

part 'request_token_paymant_response_dto.g.dart';

@JsonSerializable()
class RequestTokenPaymantResponseDto {
  String? token;

  RequestTokenPaymantResponseDto({this.token});

  factory RequestTokenPaymantResponseDto.fromJson(Map<String, dynamic> json) {
    return _$RequestTokenPaymantResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RequestTokenPaymantResponseDtoToJson(this);
  }
}
