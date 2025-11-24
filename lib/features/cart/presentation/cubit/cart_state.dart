sealed class CartState {}

class CartIntialState extends CartState {}

class CartLoadingState extends CartState {}

class CartErrorState extends CartState {
  String message;
  CartErrorState({required this.message});
}

class CartSuccessState extends CartState {
  int? numOfCartItems;
  CartSuccessState({required this.numOfCartItems});
}
