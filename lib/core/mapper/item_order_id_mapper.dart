import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/request/item_order_id.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/order_id_payman_response_dto/request/item_order_id_dto.dart';

extension ItemOrderIdMapper on ItemOrderId {
  ItemOrderIdDto convertToItemOrderId() {
    return ItemOrderIdDto(
      amountCents: amountCents,
      name: name,
      description: description,
      quantity: quantity,
    );
  }
}
