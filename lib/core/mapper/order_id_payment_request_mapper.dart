import 'package:ecommerce/core/mapper/item_order_id_mapper.dart';
import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/request/order_id_paymant_request.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/order_id_payman_response_dto/request/order_id_paymant_request_dto.dart';

extension OrderIdPaymentRequestMapper on OrderIdPaymantRequest {
  OrderIdPaymantRequestDto convertToOrderIdPaymantRequestDto() {
    return OrderIdPaymantRequestDto(
      authToken: authToken,
      amountCents: amountCents,
      currency: currency,
      deliveryNeeded: deliveryNeeded,
      items: items!.map((item) => item.convertToItemOrderId()).toList(),
    );
  }
}
