import 'package:ecommerce/features/home_tab/domin/entities/category.dart';

sealed class HomeTabState {}

class HomeTabIntitialState extends HomeTabState {}

class HomeTabLoadingState extends HomeTabState {}

class HomeTabErrorState extends HomeTabState {
  final String message;
  HomeTabErrorState({required this.message});
}

class HomeTabSuccessState extends HomeTabState {
  List<Category> categoryList;
  HomeTabSuccessState({required this.categoryList});
}
