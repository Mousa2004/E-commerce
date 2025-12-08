import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/response/merchant.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/order_id_payman_response_dto/response/merchant_dto.dart';

extension MerchantMapper on MerchantDto {
  Merchant convertToMerchant() {
    return Merchant(
      city: city,
      companyEmails: companyEmails,
      companyName: companyName,
      country: country,
      createdAt: createdAt,
      id: id,
      phones: phones,
      postalCode: postalCode,
      state: state,
      street: street,
    );
  }
}
