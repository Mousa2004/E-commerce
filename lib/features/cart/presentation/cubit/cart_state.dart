import 'package:ecommerce/features/cart/domin/entities/get_cart/get_cart.dart';

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
  GetCart getCart;
  GetCartSuccessState({required this.getCart});
}

class DeleteCartLoadingState extends CartState {}

class DeleteCartErrorState extends CartState {
  String message;
  DeleteCartErrorState({required this.message});
}

class DeleteCartSuccessState extends CartState {
  GetCart getCart;
  DeleteCartSuccessState({required this.getCart});
}
