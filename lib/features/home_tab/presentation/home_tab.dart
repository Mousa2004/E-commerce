import 'dart:async';
import 'package:ecommerce/core/injctable/di.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home/presentation/widgets/announcements_section.dart';
import 'package:ecommerce/features/home/presentation/widgets/brand_item.dart';
import 'package:ecommerce/features/home/presentation/widgets/category_item.dart';
import 'package:ecommerce/features/home/presentation/widgets/custom_section_bar.dart';
import 'package:ecommerce/features/home_tab/presentation/cubit/home_tab_brand_cubit.dart';
import 'package:ecommerce/features/home_tab/presentation/cubit/home_tab_brand_state.dart';
import 'package:ecommerce/features/home_tab/presentation/cubit/home_tab_cubit.dart';
import 'package:ecommerce/features/home_tab/presentation/cubit/home_tab_state.dart';
import 'package:ecommerce/features/products/domin/entities/products_screen_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab();

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var viewModel = getIt<HomeTabCubit>();
  var viewModelBrand = getIt<HomeTabBrandCubit>();

  @override
  void initState() {
    viewModel.getCategoeies();
    viewModelBrand.getBrands();
    super.initState();
    _startImageSwitching();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AnnouncementsSection(
            imagesPaths: viewModel.announcementsImagesPaths,
            currentIndex: viewModel.currentIndex,
            timer: viewModel.timer,
          ),
          Column(
            children: [
              CustomSectionBar(
                sectionName: 'Categories',
                onViewAllClicked: () {},
              ),
              BlocBuilder<HomeTabCubit, HomeTabState>(
                bloc: viewModel,
                builder: (context, state) {
                  if (state is HomeTabLoadingState) {
                    return const LoadingIndicator();
                  } else if (state is HomeTabErrorState) {
                    return ErrorIndicator(state.message);
                  } else if (state is HomeTabSuccessState) {
                    final categories = state.categoryList;
                    return SizedBox(
                      height: 300.h,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),

                        itemBuilder: (_, index) {
                          return CategoryItem(
                            category: categories[index],
                            onTap: () => Navigator.of(context).pushNamed(
                              Routes.products,
                              arguments: ProductsScreenArgs(
                                categoryId: categories[index].id,
                              ),
                            ),
                          );
                        },
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              SizedBox(height: 12.h),
            ],
          ),
          Column(
            children: [
              CustomSectionBar(sectionName: 'Brands', onViewAllClicked: () {}),
              BlocBuilder<HomeTabBrandCubit, HomeTabBrandState>(
                bloc: viewModelBrand,
                builder: (context, state) {
                  if (state is HomeTabBrandLoadingState) {
                    return const LoadingIndicator();
                  } else if (state is HomeTabBrandErrorState) {
                    return ErrorIndicator(state.message);
                  } else if (state is HomeTabBrandSuccessState) {
                    final brands = state.brandList;
                    return SizedBox(
                      height: 300.h,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),

                        itemBuilder: (_, index) {
                          return BrandItem(
                            brand: brands[index],
                            onTap: () => Navigator.of(context).pushNamed(
                              Routes.products,
                              arguments: ProductsScreenArgs(
                                brandId: brands[index].id,
                              ),
                            ),
                          );
                        },
                        itemCount: brands.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ],
      ),
    );
  }

  void _startImageSwitching() {
    viewModel.timer = Timer.periodic(const Duration(milliseconds: 2500), (
      Timer timer,
    ) {
      setState(
        () => viewModel.currentIndex =
            (viewModel.currentIndex + 1) %
            viewModel.announcementsImagesPaths.length,
      );
    });
  }

  @override
  void dispose() {
    viewModel.timer.cancel();
    super.dispose();
  }
}
