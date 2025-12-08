import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/request/item_order_id.dart';

class OrderIdPaymantRequest {
  String? authToken;
  String? deliveryNeeded;
  String? amountCents;
  String? currency;
  List<ItemOrderId>? items;

  OrderIdPaymantRequest({
    this.authToken,
    this.deliveryNeeded,
    this.amountCents,
    this.currency,
    this.items,
  });
}
