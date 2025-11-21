import 'package:ecommerce/features/products/domin/entities/product.dart';

sealed class ProductState {}

class ProductIntitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductErrorState extends ProductState {
  final String message;
  ProductErrorState({required this.message});
}

class ProductSuccessState extends ProductState {
  List<Product> productList;
  ProductSuccessState({required this.productList});
}
