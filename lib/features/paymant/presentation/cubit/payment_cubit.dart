import 'package:dio/dio.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/features/paymant/domin/entities/auth_token_paymant/request/auth_token_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/order_id_paymant/request/order_id_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/entities/request_token_paymant/request/request_token_paymant_request.dart';
import 'package:ecommerce/features/paymant/domin/use_case/auth_token_payment_use_case.dart';
import 'package:ecommerce/features/paymant/domin/use_case/order_id_payment_use_case.dart';
import 'package:ecommerce/features/paymant/domin/use_case/request_token_payment_use_case.dart';
import 'package:ecommerce/features/paymant/presentation/cubit/payment_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentCubit extends Cubit<PaymentState> {
  AuthTokenPaymentUseCase authTokenPaymentUseCase;
  OrderIdPaymentUseCase orderIdPaymentUseCase;
  RequestTokenPaymentUseCase requestTokenPaymentUseCase;

  PaymentCubit({
    required this.authTokenPaymentUseCase,
    required this.orderIdPaymentUseCase,
    required this.requestTokenPaymentUseCase,
  }) : super(PaymentInitialState());

  static GlobalKey<FormState> globalKey = GlobalKey();
  static late TextEditingController fNameController;
  static late TextEditingController lNameController;
  static late TextEditingController emailController;
  static late TextEditingController phoneController;
  static late TextEditingController cityController;
  static late TextEditingController streetController;

  static void clearFields() {
    fNameController.clear();
    lNameController.clear();
    emailController.clear();
    phoneController.clear();
    cityController.clear();
    streetController.clear();
  }

  static PaymentCubit get(context) => BlocProvider.of<PaymentCubit>(context);

  Future<String> getAuthTokenPayment() async {
    try {
      emit(AuthTokenPaymentLoadingState());
      final authTokenPaymantRequest = AuthTokenPaymantRequest();
      final authTokenPaymantResponse = await authTokenPaymentUseCase.invoke(
        authTokenPaymantRequest: authTokenPaymantRequest,
      );

      emit(
        AuthTokenPaymentSuccessState(
          authTokenPaymantResponse: authTokenPaymantResponse,
        ),
      );

      return authTokenPaymantResponse.token!;
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    } on AppException catch (e) {
      emit(AuthTokenPaymentErrorrState(message: e.message!));
      throw ServerException(message: "Failed to get auth token: $e");
    }
  }

  Future<int> getOrderIdPayment({
    required OrderIdPaymantRequest orderIdPaymantRequest,
  }) async {
    try {
      emit(OrderIdPaymentLoadingState());
      final authToken = await getAuthTokenPayment();
      orderIdPaymantRequest.authToken = authToken;
      final orderIdPaymantResponse = await orderIdPaymentUseCase.invoke(
        orderIdPaymantRequest: orderIdPaymantRequest,
      );

      emit(
        OrderIdPaymentSuccessState(
          orderIdPaymantResponse: orderIdPaymantResponse,
        ),
      );
      return orderIdPaymantResponse.id!;
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    } on AppException catch (e) {
      emit(OrderIdPaymentErrorrState(message: e.message!));
      throw ServerException(message: "Failed to get order id: $e");
    }
  }

  Future<void> getRequesTokenPayment({
    required RequestTokenPaymantRequest requestTokenPaymantRequest,
    required OrderIdPaymantRequest orderIdPaymantRequest,
  }) async {
    try {
      emit(RequestTokenPaymentLoadingState());
      final authToken = await getAuthTokenPayment();
      final orderId = await getOrderIdPayment(
        orderIdPaymantRequest: orderIdPaymantRequest,
      );
      requestTokenPaymantRequest.authToken = authToken;
      requestTokenPaymantRequest.orderId = orderId.toString();

      final requestTokenPaymantResponse = await requestTokenPaymentUseCase
          .invoke(requestTokenPaymantRequest: requestTokenPaymantRequest);

      emit(
        RequestTokenPaymentSuccessState(
          token: requestTokenPaymantResponse.token!,
        ),
      );
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    } on AppException catch (e) {
      emit(RequestTokenPaymentErrorrState(message: e.message!));
    }
  }
}
