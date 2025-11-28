import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistTab extends StatefulWidget {
  const WishlistTab();

  @override
  State<WishlistTab> createState() => _WishlistTabState();
}

class _WishlistTabState extends State<WishlistTab> {
  @override
  void initState() {
    super.initState();
    WishlistCubit.get(context).getProductFromWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      buildWhen: (previous, current) =>
          current is GetLoadingWishlistState ||
          current is GetSuccessWishlistState ||
          current is GetErrorWishlistState,
      builder: (context, state) {
        if (state is GetLoadingWishlistState) {
          return const LoadingIndicator();
        } else if (state is GetErrorWishlistState) {
          return Center(child: Text(state.message, style: getTextWithLine()));
        } else if (state is GetSuccessWishlistState) {
          final productList = state.getProductFromWishlistResponse.data!;
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.s14.w,
              vertical: Sizes.s10.h,
            ),
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (_, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: Sizes.s12.h),
                child: WishlistItem(product: productList[index]),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
