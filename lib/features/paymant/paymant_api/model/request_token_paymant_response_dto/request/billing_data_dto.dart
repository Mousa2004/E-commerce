import 'package:json_annotation/json_annotation.dart';

part 'billing_data_dto.g.dart';

@JsonSerializable()
class BillingDataDto {
  String? email;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? street;
  String? building;
  String? floor;
  String? apartment;
  String? city;
  String? country;

  BillingDataDto({
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.street,
    this.building = "NA",
    this.floor = "NA",
    this.apartment = "NA",
    this.city,
    this.country = "NA",
  });

  factory BillingDataDto.fromJson(Map<String, dynamic> json) {
    return _$BillingDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BillingDataDtoToJson(this);
}
