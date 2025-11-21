import 'package:dio/dio.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/features/products/domin/use_cases/product_use_case.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  ProductUseCase productUseCase;
  ProductCubit({required this.productUseCase}) : super(ProductIntitialState());

  void getProducts() async {
    try {
      emit(ProductLoadingState());
      final productList = await productUseCase.invoke();

      emit(ProductSuccessState(productList: productList ?? []));
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    } on AppException catch (e) {
      emit(ProductErrorState(message: e.message!));
    }
  }
}
