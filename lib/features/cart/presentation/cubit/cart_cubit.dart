import 'package:dio/dio.dart';
import 'package:ecommerce/core/cache/shared_prefrence_utls.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/features/cart/domin/use_cases/add_cart_use_case.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  AddCartUseCase addCartUseCase;

  CartCubit({required this.addCartUseCase}) : super(CartIntialState()) {
    _loadCartCount();
  }

  static CartCubit get(context) => BlocProvider.of<CartCubit>(context);
  int numOfCartItems = 0;

  Future<void> _loadCartCount() async {
    numOfCartItems =
        (SharedPrefrenceUtls.getData(key: "cartCount") ?? 0) as int;
    emit(CartSuccessState(numOfCartItems: numOfCartItems));
  }

  Future<void> addCart(String productId) async {
    try {
      emit(CartLoadingState());
      final addCartResponse = await addCartUseCase.invoke(productId);
      numOfCartItems = addCartResponse.numOfCartItems ?? 0;
      SharedPrefrenceUtls.saveData(key: "cartCount", value: numOfCartItems);
      emit(CartSuccessState(numOfCartItems: numOfCartItems));
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      emit(CartErrorState(message: message!));
    } on AppException catch (e) {
      emit(CartErrorState(message: e.message!));
    }
  }
}
