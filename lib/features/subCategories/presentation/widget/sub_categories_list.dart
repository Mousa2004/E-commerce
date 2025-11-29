import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home/presentation/widgets/category_card_item.dart';
import 'package:ecommerce/features/home/presentation/widgets/sub_category_item.dart';
import 'package:ecommerce/features/subCategories/presentation/cubit/subcategories_cubit.dart';
import 'package:ecommerce/features/subCategories/presentation/cubit/subcategories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesList extends StatefulWidget {
  const SubCategoriesList();

  @override
  State<SubCategoriesList> createState() => _SubCategoriesListState();
}

class _SubCategoriesListState extends State<SubCategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocBuilder<SubcategoriesCubit, SubcategoriesState>(
        builder: (context, state) {
          if (state is SubcategoriesLoadingState) {
            return const LoadingIndicator();
          } else if (state is SubcategoriesErrorState) {
            return ErrorIndicator(state.message);
          } else if (state is SubcategoriesSeccessState) {
            final subCategory = state.subcategoriesResponse.data;
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: CategoryCardItem(
                    'Laptops',
                    ImageAssets.categoryCardImage,
                  ),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: subCategory!.length,
                    (_, index) => SubCategoryItem(
                      '${subCategory[index].name}',
                      ImageAssets.subcategoryCardImage,
                    ),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.65,
                    mainAxisSpacing: Sizes.s8.h,
                    crossAxisSpacing: Sizes.s8.w,
                  ),
                ),
              ],
            );
          }
          return Center(
            child: Text(
              "No items are currently available",
              style: getBoldStyle(color: ColorManager.primary),
            ),
          );
        },
      ),
    );
  }
}
