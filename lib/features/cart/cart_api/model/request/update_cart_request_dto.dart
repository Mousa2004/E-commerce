import 'package:json_annotation/json_annotation.dart';

part 'update_cart_request_dto.g.dart';

@JsonSerializable()
class UpdateCartRequestDto {
  String? count;

  UpdateCartRequestDto({this.count});

  factory UpdateCartRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateCartRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateCartRequestDtoToJson(this);
}
