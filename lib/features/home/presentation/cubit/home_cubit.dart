import 'package:ecommerce/features/home/presentation/cubit/home_state.dart';
import 'package:ecommerce/features/home_tab/presentation/home_tab.dart';
import 'package:ecommerce/features/profile/presentation/widgets/profile_tab.dart';
import 'package:ecommerce/features/subCategories/presentation/screen/categories_tab.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/wishlist_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const CategoriesTab(),
    const WishlistTab(),
    const ProfileTab(),
  ];
  void changeSelectedIndex(int selectedIndex) {
    currentIndex = selectedIndex;
    emit(ChangeHomeState());
  }
}
