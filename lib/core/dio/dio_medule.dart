import 'package:dio/dio.dart';
import 'package:ecommerce/core/endpoints/api_endpoints.dart';
import 'package:ecommerce/core/dio/dio_interceptors.dart';
import 'package:ecommerce/features/auth/auth_api/web_service.dart';
import 'package:ecommerce/features/cart/cart_api/cart_web_service.dart';
import 'package:ecommerce/features/home_tab/home_tap_api/home_web_server.dart';
import 'package:ecommerce/features/products/product_tap_api/product_web_server.dart';
import 'package:ecommerce/features/wishlist/wishlist_api/wishlist_web_service.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioMedule {
  @singleton
  @injectable
  BaseOptions provideBaseOptions() {
    return BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
    );
  }

  @singleton
  @injectable
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    );
  }

  @singleton
  @injectable
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    final dio = Dio(baseOptions);
    //todo: dio interceptors
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @singleton
  @injectable
  WebService provideWebService(Dio dio) => WebService(dio);

  @singleton
  @injectable
  HomeWebServer provideHomeWebServer(Dio dio) => HomeWebServer(dio);

  @singleton
  @injectable
  ProductWebServer provideProductWebServer(Dio dio) => ProductWebServer(dio);

  @singleton
  @injectable
  CartWebService provideCartWebService(Dio dio) => CartWebService(dio);

  @singleton
  @injectable
  WishlistWebService provideWishlistWebService(Dio dio) =>
      WishlistWebService(dio);
}
