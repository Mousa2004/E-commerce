import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce/features/auth/presentation/screens/register_screen.dart';
import 'package:ecommerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce/features/paymant/presentation/screen/payment_method_screen.dart';
import 'package:ecommerce/features/paymant/presentation/screen/payment_screen.dart';
import 'package:ecommerce/features/products/presentation/screens/product_details.dart';
import 'package:ecommerce/features/products/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.products:
        return MaterialPageRoute(
          builder: (_) => const ProductsScreen(),
          settings: settings,
        );
      case Routes.productDetails:
        return MaterialPageRoute(
          builder: (_) => const ProductDetails(),
          settings: settings,
        );
      case Routes.cart:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
          settings: settings,
        );

      case Routes.paymentScreen:
        return MaterialPageRoute(
          builder: (_) => const PaymentScreen(),
          settings: settings,
        );

      case Routes.paymentMethodScreen:
        return MaterialPageRoute(
          builder: (_) => const PaymentMethodScreen(),
          settings: settings,
        );
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
