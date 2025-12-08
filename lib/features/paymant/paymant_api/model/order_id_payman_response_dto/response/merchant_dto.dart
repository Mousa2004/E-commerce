import 'package:json_annotation/json_annotation.dart';

part 'merchant_dto.g.dart';

@JsonSerializable()
class MerchantDto {
  int? id;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  List<String>? phones;
  @JsonKey(name: 'company_emails')
  List<String>? companyEmails;
  @JsonKey(name: 'company_name')
  String? companyName;
  String? state;
  String? country;
  String? city;
  @JsonKey(name: 'postal_code')
  String? postalCode;
  String? street;

  MerchantDto({
    this.id,
    this.createdAt,
    this.phones,
    this.companyEmails,
    this.companyName,
    this.state,
    this.country,
    this.city,
    this.postalCode,
    this.street,
  });

  factory MerchantDto.fromJson(Map<String, dynamic> json) {
    return _$MerchantDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MerchantDtoToJson(this);
}
