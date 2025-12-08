import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/request/billing_data.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/request_token_paymant_response_dto/request/billing_data_dto.dart';

extension BillingDataMapper on BillingData {
  BillingDataDto convertToBillingDataDto() {
    return BillingDataDto(
      apartment: apartment,
      building: building,
      city: city,
      country: country,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      street: street,
      floor: floor,
    );
  }
}
