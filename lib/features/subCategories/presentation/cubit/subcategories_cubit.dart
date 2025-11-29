import 'package:dio/dio.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/features/subCategories/domin/use_case/subcategories_use_case.dart';
import 'package:ecommerce/features/subCategories/presentation/cubit/subcategories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubcategoriesCubit extends Cubit<SubcategoriesState> {
  SubcategoriesUseCase subcategoriesUseCase;
  SubcategoriesCubit({required this.subcategoriesUseCase})
    : super(SubcategoriesInitialState());

  Future<void> getSubCategories({String? categoryId}) async {
    try {
      emit(SubcategoriesLoadingState());
      final subcategoriesResponse = await subcategoriesUseCase.invoke(
        categoryId: categoryId,
      );

      emit(
        SubcategoriesSeccessState(subcategoriesResponse: subcategoriesResponse),
      );
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    } on AppException catch (e) {
      emit(SubcategoriesErrorState(message: e.message!));
    }
  }
}
