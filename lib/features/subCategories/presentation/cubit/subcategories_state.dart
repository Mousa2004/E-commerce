import 'package:ecommerce/features/subCategories/domin/entities/subcategories_response.dart';

sealed class SubcategoriesState {}

class SubcategoriesInitialState extends SubcategoriesState {}

class SubcategoriesLoadingState extends SubcategoriesState {}

class SubcategoriesSeccessState extends SubcategoriesState {
  SubcategoriesResponse subcategoriesResponse;
  SubcategoriesSeccessState({required this.subcategoriesResponse});
}

class SubcategoriesErrorState extends SubcategoriesState {
  String message;
  SubcategoriesErrorState({required this.message});
}
