import 'package:dio/dio.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart_product.dart';
import 'package:ecommerce/features/cart/domin/use_cases/add_cart_use_case.dart';
import 'package:ecommerce/features/cart/domin/use_cases/delete_cart_use_case.dart';
import 'package:ecommerce/features/cart/domin/use_cases/get_cart_use_case.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  AddCartUseCase addCartUseCase;
  GetCartUseCase getCartUseCase;
  DeleteCartUseCase deleteCartUseCase;

  CartCubit({
    required this.addCartUseCase,
    required this.getCartUseCase,
    required this.deleteCartUseCase,
  }) : super(CartIntialState());

  static CartCubit get(context) => BlocProvider.of<CartCubit>(context);
  int numOfCartItems = 0;
  List<GetCartProduct> cartProduct = [];
  Future<void> addCart(String productId) async {
    try {
      emit(AddCartLoadingState());
      final addCartResponse = await addCartUseCase.invoke(productId);
      numOfCartItems = addCartResponse.numOfCartItems ?? 0;
      emit(AddCartSuccessState(numOfCartItems: numOfCartItems));
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      emit(AddCartErrorState(message: message!));
    } on AppException catch (e) {
      emit(AddCartErrorState(message: e.message!));
    }
  }

  Future<void> getCart() async {
    try {
      emit(GetCartLoadingState());
      final getCartResponse = await getCartUseCase.invoke();
      numOfCartItems = getCartResponse.numOfCartItems ?? 0;
      cartProduct = getCartResponse.data!.products!;
      emit(GetCartSuccessState(getCart: getCartResponse.data!));
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      emit(GetCartErrorState(message: message!));
    } on AppException catch (e) {
      emit(GetCartErrorState(message: e.message!));
    }
  }

  Future<void> deleteCart(String productId) async {
    try {
      final deleteCartResponse = await deleteCartUseCase.invoke(productId);
      numOfCartItems = deleteCartResponse.numOfCartItems ?? 0;
      cartProduct = deleteCartResponse.data!.products!;
      emit(DeleteCartSuccessState(getCart: deleteCartResponse.data!));
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      emit(DeleteCartErrorState(message: message!));
    } on AppException catch (e) {
      emit(DeleteCartErrorState(message: e.message!));
    }
  }
}
