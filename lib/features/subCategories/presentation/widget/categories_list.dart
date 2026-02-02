import 'package:ecommerce/core/injctable/di.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home/presentation/widgets/category_text_item.dart';
import 'package:ecommerce/features/home_tab/domin/entities/brand.dart';
import 'package:ecommerce/features/home_tab/presentation/cubit/home_tab_brand_cubit.dart';
import 'package:ecommerce/features/home_tab/presentation/cubit/home_tab_brand_state.dart';
import 'package:ecommerce/features/home_tab/presentation/cubit/home_tab_state.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList();

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int _selectedIndex = 0;
  final viewmodel = getIt<HomeTabBrandCubit>();

  @override
  void initState() {
    super.initState();
    viewmodel.getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabBrandCubit, HomeTabBrandState>(
      bloc: viewmodel,
      builder: (context, state) {
        if (state is HomeTabLoadingState) {
          return const LoadingIndicator();
        } else if (state is HomeTabBrandErrorState) {
          return ErrorIndicator(state.message);
        } else if (state is HomeTabBrandSuccessState) {
          final brandList = state.brandList;
          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.containerGray,
                border: BorderDirectional(
                  top: BorderSide(
                    width: Sizes.s2,
                    color: ColorManager.primary.withOpacity(0.3),
                  ),
                  start: BorderSide(
                    width: Sizes.s2,
                    color: ColorManager.primary.withOpacity(0.3),
                  ),
                  bottom: BorderSide(
                    width: Sizes.s2,
                    color: ColorManager.primary.withOpacity(0.3),
                  ),
                ),
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(Sizes.s12.r),
                  bottomStart: Radius.circular(Sizes.s12.r),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(Sizes.s12.r),
                  bottomStart: Radius.circular(Sizes.s12.r),
                ),
                child: ListView.builder(
                  itemCount: brandList.length,
                  itemBuilder: (_, index) => CategoryTextItem(
                    index,
                    '${brandList[index].slug}',
                    _selectedIndex == index,
                    (int _) => onItemClick(index: index, brandList: brandList),
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  void onItemClick({int? index, List<Brand>? brandList}) {
    setState(() => _selectedIndex = index!);

    final categoryId = brandList![index!].id;

    context.read<ProductCubit>().getBrandProducts(brandId: categoryId);
  }
}
