import 'package:dio/dio.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/features/products/domin/use_cases/brand_product_use_case.dart';
import 'package:ecommerce/features/products/domin/use_cases/category_product_use_case.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  CategoryProductUseCase categoryProductUseCase;
  BrandProductUseCase brandProductUseCase;
  ProductCubit({
    required this.categoryProductUseCase,
    required this.brandProductUseCase,
  }) : super(ProductIntitialState());

  void getCategoryProducts({String? categoryId}) async {
    try {
      emit(ProductLoadingState());
      final productList = await categoryProductUseCase.invoke(
        categoryId: categoryId,
      );

      emit(ProductSuccessState(productList: productList ?? []));
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    } on AppException catch (e) {
      emit(ProductErrorState(message: e.message!));
    }
  }

  void getBrandProducts({String? brandId}) async {
    try {
      emit(ProductLoadingState());
      final productList = await brandProductUseCase.invoke(brandId: brandId);

      emit(ProductSuccessState(productList: productList ?? []));
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    } on AppException catch (e) {
      emit(ProductErrorState(message: e.message!));
    }
  }
}
