import 'dart:async';

import 'package:ecommerce/core/app_bloc_observer.dart';
import 'package:ecommerce/core/cache/shared_prefrence_utls.dart';
import 'package:ecommerce/core/injctable/di.dart';
import 'package:ecommerce/core/routes/route_generator.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrenceUtls.init();
  Bloc.observer = AppBlocObserver();
  configureDependencies();
  String routeName;
  final token = SharedPrefrenceUtls.getData(key: "token");

  if (token == null) {
    routeName = Routes.login;
  } else {
    routeName = Routes.home;
  }

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<CartCubit>())],
      child: ECommerceApp(routeName: routeName),
    ),
  );
}

class ECommerceApp extends StatelessWidget {
  final String routeName;
  const ECommerceApp({required this.routeName});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: routeName,
      ),
    );
  }
}
