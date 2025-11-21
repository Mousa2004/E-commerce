import 'package:ecommerce/core/injctable/di.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/widgets/home_screen_app_bar.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_cubit.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_state.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen();

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final viewModel = getIt<ProductCubit>();
  @override
  void initState() {
    super.initState();
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: ColorManager.primary),
          );
        } else if (state is ProductErrorState) {
          return Center(child: Text(state.message, style: getTextWithLine()));
        } else if (state is ProductSuccessState) {
          final productList = state.productList;
          return Scaffold(
            appBar: const HomeScreenAppBar(automaticallyImplyLeading: true),
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 6 / 9,
              ),
              itemBuilder: (_, index) => ProductItem(
                product: productList[index],
                onTap: () => Navigator.of(context).pushNamed(
                  Routes.productDetails,
                  arguments: state.productList[index],
                ),
              ),
              itemCount: productList.length,
              padding: EdgeInsets.all(Insets.s16.sp),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
