import 'package:dio/dio.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/features/wishlist/domin/use_case/add_product_to_wishlist_use_case.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  AddProductToWishlistUseCase addProductToWishlistUseCase;
  WishlistCubit({required this.addProductToWishlistUseCase})
    : super(InitialWishlistState());

  static WishlistCubit get(context) => BlocProvider.of<WishlistCubit>(context);

  Future<void> addProductToWishlist({String? productId}) async {
    try {
      final addToWishlist = await addProductToWishlistUseCase.invoke(
        productId: productId,
      );
      print("Add product to wishlist successfully");
      emit(
        AddSuccessWishlistState(addProductToWishlistResponse: addToWishlist),
      );
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    } on AppException catch (e) {
      emit(AddErrorWishlistState(message: e.message!));
    }
  }
}
