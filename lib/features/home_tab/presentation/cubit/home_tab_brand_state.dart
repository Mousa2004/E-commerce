import 'package:ecommerce/features/home_tab/domin/entities/brand.dart';

sealed class HomeTabBrandState {}

class HomeTabBrandIntitialState extends HomeTabBrandState {}

class HomeTabBrandLoadingState extends HomeTabBrandState {}

class HomeTabBrandErrorState extends HomeTabBrandState {
  final String message;
  HomeTabBrandErrorState({required this.message});
}

class HomeTabBrandSuccessState extends HomeTabBrandState {
  List<Brand> brandList;
  HomeTabBrandSuccessState({required this.brandList});
}
