import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart_response.dart';

sealed class CartState {}

class CartIntialState extends CartState {}

class AddCartLoadingState extends CartState {}

class AddCartErrorState extends CartState {
  String message;
  AddCartErrorState({required this.message});
}

class AddCartSuccessState extends CartState {
  int? numOfCartItems;
  AddCartSuccessState({required this.numOfCartItems});
}

class GetCartLoadingState extends CartState {}

class GetCartErrorState extends CartState {
  String message;
  GetCartErrorState({required this.message});
}

class GetCartSuccessState extends CartState {
  GetCartResponse getCartResponse;
  GetCartSuccessState({required this.getCartResponse});
}
