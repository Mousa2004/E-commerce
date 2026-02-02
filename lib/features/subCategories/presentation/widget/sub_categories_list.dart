import 'package:ecommerce/core/injctable/di.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home/presentation/widgets/category_card_item.dart';
import 'package:ecommerce/features/home/presentation/widgets/sub_category_item.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_cubit.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesList extends StatefulWidget {
  const SubCategoriesList();

  @override
  State<SubCategoriesList> createState() => _SubCategoriesListState();
}

class _SubCategoriesListState extends State<SubCategoriesList> {
  final viewModel = getIt<ProductCubit>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const LoadingIndicator();
          } else if (state is ProductErrorState) {
            return ErrorIndicator(state.message);
          } else if (state is ProductSuccessState) {
            final subCategory = state.productList;

            if (subCategory.isEmpty) {
              return Center(
                child: Text(
                  "No items are currently available",
                  style: getBoldStyle(
                    color: ColorManager.primary,
                    fontSize: 15.sp,
                  ),
                ),
              );
            }

            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: CategoryCardItem(ImageAssets.categoryCardImage),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: subCategory.length,
                    (_, index) => SubCategoryItem(
                      "${subCategory[index].title}",
                      "${subCategory[index].imageCover}",
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

          return const SizedBox();
        },
      ),
    );
  }
}
