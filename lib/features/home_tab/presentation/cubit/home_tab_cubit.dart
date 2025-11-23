import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ecommerce/core/exception/app_exception.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/features/home_tab/domin/use_cases/home_tab_use_case.dart';
import 'package:ecommerce/features/home_tab/presentation/cubit/home_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabUseCase homeTabUseCase;
  HomeTabCubit({required this.homeTabUseCase}) : super(HomeTabIntitialState());
  int currentIndex = 0;
  late Timer timer;
  final List<String> announcementsImagesPaths = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];
  void getCategoeies() async {
    try {
      emit(HomeTabLoadingState());
      final categoryList = await homeTabUseCase.invoke();

      emit(HomeTabSuccessState(categoryList: categoryList ?? []));
    } on DioException catch (e) {
      final message = (e.error as AppException).message;
      emit(HomeTabErrorState(message: message!));
    } on AppException catch (e) {
      emit(HomeTabErrorState(message: e.message!));
    }
  }
}
