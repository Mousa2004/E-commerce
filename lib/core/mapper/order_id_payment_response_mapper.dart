import 'package:ecommerce/core/mapper/merchant_mapper.dart';
import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/response/order_id_paymant_response.dart';
import 'package:ecommerce/features/paymant/paymant_api/model/order_id_payman_response_dto/response/order_id_payman_response_dto.dart';

extension OrderIdPaymentResponseMapper on OrderIdPaymanResponseDto {
  OrderIdPaymantResponse covertToOrderIdPaymantResponse() {
    return OrderIdPaymantResponse(
      amountCents: amountCents,
      apiSource: apiSource,
      collector: collector,
      commissionFees: commissionFees,
      createdAt: createdAt,
      currency: currency,
      deliveryFeesCents: deliveryFeesCents,
      deliveryNeeded: deliveryNeeded,
      deliveryVatCents: deliveryVatCents,
      id: id,
      isReturned: isReturn,
      isCancel: isCancel,
      isCanceled: isCanceled,
      isPaymentLocked: isPaymentLocked,
      isReturn: isReturn,
      items: items,
      merchant: merchant!.convertToMerchant(),
      merchantOrderId: merchantOrderId,
      merchantStaffTag: merchantStaffTag,
      notifyUserWithEmail: notifyUserWithEmail,
      orderUrl: orderUrl,
      paidAmountCents: paidAmountCents,
      paymentMethod: paymentMethod,
      paymentStatus: paymentStatus,
      shippingData: shippingData,
      terminalVersion: terminalVersion,
      token: token,
      url: url,
      walletNotification: walletNotification,
    );
  }
}
