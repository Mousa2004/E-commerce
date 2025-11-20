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
import '../../features/auth/auth_api/dio/dio_medule.dart' as _i411;
import '../../features/auth/auth_api/web_service.dart' as _i608;
import '../../features/auth/data/data_sources/remote/auth_remote_data_sources.dart'
    as _i8;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domin/repositories/auth_repository.dart' as _i333;
import '../../features/auth/domin/use_cases/login_use_case.dart' as _i210;
import '../../features/auth/domin/use_cases/register_use_case.dart' as _i263;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioMedule = _$DioMedule();
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
    gh.factory<_i8.AuthRemoteDataSources>(
      () => _i716.AuthRemoteDataSourcesImpl(webService: gh<_i608.WebService>()),
    );
    gh.factory<_i333.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        remoteDataSources: gh<_i8.AuthRemoteDataSources>(),
      ),
    );
    gh.factory<_i263.RegisterUseCase>(
      () => _i263.RegisterUseCase(athRepository: gh<_i333.AuthRepository>()),
    );
    gh.factory<_i210.LoginUseCase>(
      () => _i210.LoginUseCase(authRepository: gh<_i333.AuthRepository>()),
    );
    gh.factory<_i117.AuthCubit>(
      () => _i117.AuthCubit(
        loginUseCase: gh<_i210.LoginUseCase>(),
        registerUseCase: gh<_i263.RegisterUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioMedule extends _i411.DioMedule {}
