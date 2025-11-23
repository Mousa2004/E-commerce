// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/auth/auth_api/data_sources/remote/auth_remote_data_sources_impl.dart'
    as _i716;
import '../../features/auth/auth_api/web_service.dart' as _i608;
import '../../features/auth/data/data_sources/remote/auth_remote_data_sources.dart'
    as _i8;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domin/repositories/auth_repository.dart' as _i333;
import '../../features/auth/domin/use_cases/login_use_case.dart' as _i210;
import '../../features/auth/domin/use_cases/register_use_case.dart' as _i263;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../../features/home_tab/data/data_sources/remote/home_tap_remote_data_sources.dart'
    as _i1048;
import '../../features/home_tab/data/repositories/home_tab_repository_impl.dart'
    as _i129;
import '../../features/home_tab/domin/repositories/home_tab_repository.dart'
    as _i940;
import '../../features/home_tab/domin/use_cases/home_tab_brand_use_case.dart'
    as _i994;
import '../../features/home_tab/domin/use_cases/home_tab_use_case.dart'
    as _i1026;
import '../../features/home_tab/home_tap_api/data_sources/remote/home_tap_remote_data_sources_impl.dart'
    as _i45;
import '../../features/home_tab/home_tap_api/home_web_server.dart' as _i350;
import '../../features/home_tab/presentation/cubit/home_tab_brand_cubit.dart'
    as _i678;
import '../../features/home_tab/presentation/cubit/home_tab_cubit.dart'
    as _i1069;
import '../../features/products/data/data_sources/remote/product_remote_data_sources.dart'
    as _i827;
import '../../features/products/data/repositories/product_repository_impl.dart'
    as _i764;
import '../../features/products/domin/repositories/product_repository.dart'
    as _i80;
import '../../features/products/domin/use_cases/product_use_case.dart' as _i922;
import '../../features/products/presentation/cubit/product_cubit.dart' as _i661;
import '../../features/products/product_tap_api/data_sources/remote/product_remote_data_sources_impl.dart'
    as _i753;
import '../../features/products/product_tap_api/product_web_server.dart'
    as _i341;
import '../dio/dio_medule.dart' as _i322;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioMedule = _$DioMedule();
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit());
    gh.singleton<_i361.BaseOptions>(() => dioMedule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
      () => dioMedule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => dioMedule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i608.WebService>(
      () => dioMedule.provideWebService(gh<_i361.Dio>()),
    );
    gh.singleton<_i350.HomeWebServer>(
      () => dioMedule.provideHomeWebServer(gh<_i361.Dio>()),
    );
    gh.singleton<_i341.ProductWebServer>(
      () => dioMedule.provideProductWebServer(gh<_i361.Dio>()),
    );
    gh.factory<_i8.AuthRemoteDataSources>(
      () => _i716.AuthRemoteDataSourcesImpl(webService: gh<_i608.WebService>()),
    );
    gh.factory<_i333.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        remoteDataSources: gh<_i8.AuthRemoteDataSources>(),
      ),
    );
    gh.factory<_i827.ProductRemoteDataSources>(
      () => _i753.ProductRemoteDataSourcesImpl(
        productWebServer: gh<_i341.ProductWebServer>(),
      ),
    );
    gh.factory<_i1048.HomeTapRemoteDataSources>(
      () => _i45.HomeTapRemoteDataSourcesImpl(
        homeWebServer: gh<_i350.HomeWebServer>(),
      ),
    );
    gh.factory<_i263.RegisterUseCase>(
      () => _i263.RegisterUseCase(athRepository: gh<_i333.AuthRepository>()),
    );
    gh.factory<_i210.LoginUseCase>(
      () => _i210.LoginUseCase(authRepository: gh<_i333.AuthRepository>()),
    );
    gh.factory<_i80.ProductRepository>(
      () => _i764.ProductRepositoryImpl(
        productRemoteDataSources: gh<_i827.ProductRemoteDataSources>(),
      ),
    );
    gh.factory<_i940.HomeTabRepository>(
      () => _i129.HomeTabRepositoryImpl(
        homeTapRemoteDataSources: gh<_i1048.HomeTapRemoteDataSources>(),
      ),
    );
    gh.factory<_i117.AuthCubit>(
      () => _i117.AuthCubit(
        loginUseCase: gh<_i210.LoginUseCase>(),
        registerUseCase: gh<_i263.RegisterUseCase>(),
      ),
    );
    gh.factory<_i922.ProductUseCase>(
      () =>
          _i922.ProductUseCase(productRepository: gh<_i80.ProductRepository>()),
    );
    gh.factory<_i661.ProductCubit>(
      () => _i661.ProductCubit(productUseCase: gh<_i922.ProductUseCase>()),
    );
    gh.factory<_i994.HomeTabBrandUseCase>(
      () => _i994.HomeTabBrandUseCase(
        homeTabRepository: gh<_i940.HomeTabRepository>(),
      ),
    );
    gh.factory<_i1026.HomeTabUseCase>(
      () => _i1026.HomeTabUseCase(
        homeTabRepository: gh<_i940.HomeTabRepository>(),
      ),
    );
    gh.factory<_i678.HomeTabBrandCubit>(
      () => _i678.HomeTabBrandCubit(
        homeTabBrandUseCase: gh<_i994.HomeTabBrandUseCase>(),
      ),
    );
    gh.factory<_i1069.HomeTabCubit>(
      () => _i1069.HomeTabCubit(homeTabUseCase: gh<_i1026.HomeTabUseCase>()),
    );
    return this;
  }
}

class _$DioMedule extends _i322.DioMedule {}
