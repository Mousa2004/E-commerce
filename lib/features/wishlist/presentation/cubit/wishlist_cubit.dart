import 'package:dio/dio.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/features/products/domin/entities/product.dart';
import 'package:ecommerce/features/wishlist/domin/use_case/add_product_to_wishlist_use_case.dart';
import 'package:ecommerce/features/wishlist/domin/use_case/delete_product_from_wishlst_use_case.dart';
import 'package:ecommerce/features/wishlist/domin/use_case/get_product_from_wishlist_use_case.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  AddProductToWishlistUseCase addProductToWishlistUseCase;
  GetProductFromWishlistUseCase getProductFromWishlistUseCase;
  DeleteProductFromWishlstUseCase deleteProductFromWishlstUseCase;
  WishlistCubit({
    required this.addProductToWishlistUseCase,
    required this.getProductFromWishlistUseCase,
    required this.deleteProductFromWishlstUseCase,
  }) : super(InitialWishlistState());

  static WishlistCubit get(context) => BlocProvider.of<WishlistCubit>(context);

  List<Product> wishlistProducts = [];

  Future<void> addProductToWishlist({String? productId}) async {
    try {
      final addToWishlist = await addProductToWishlistUseCase.invoke(
        productId: productId,
      );
      await getProductFromWishlist();
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

  Future<void> getProductFromWishlist() async {
    emit(GetLoadingWishlistState());
    try {
      final getFromWishlist = await getProductFromWishlistUseCase.invoke();
      wishlistProducts = getFromWishlist.data ?? [];
      emit(
        GetSuccessWishlistState(
          getProductFromWishlistResponse: getFromWishlist,
        ),
      );
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    } on AppException catch (e) {
      emit(GetErrorWishlistState(message: e.message!));
    }
  }

  Future<void> deleteProductFromWishlist({String? productId}) async {
    try {
      final deleteFromWishlist = await deleteProductFromWishlstUseCase.invoke(
        productId: productId,
      );
      await getProductFromWishlist();
      emit(
        DeleteSuccessWishlistState(
          deleteProductFromWishlistRespose: deleteFromWishlist,
        ),
      );
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      throw ServerException(message: message);
    } on AppException catch (e) {
      emit(DeleteErrorWishlistState(message: e.message!));
    }
  }
}
