import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/features/products/domin/entities/product.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeartButton extends StatelessWidget {
  final Product product;

  const HeartButton({required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        final cubit = WishlistCubit.get(context);

        final isFav = cubit.wishlistProducts.any((p) => p.id == product.id);

        final heartIcon = isFav ? IconsAssets.clickedHeart : IconsAssets.heart;

        return InkWell(
          onTap: () {
            if (isFav) {
              cubit.deleteProductFromWishlist(productId: product.id);
            } else {
              cubit.addProductToWishlist(productId: product.id);
            }
          },
          child: Material(
            color: ColorManager.white,
            elevation: 5,
            shape: const StadiumBorder(),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: ImageIcon(
                AssetImage(heartIcon),
                color: ColorManager.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
