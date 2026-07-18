// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rest_sample/core/network/api_client.dart' as _i191;
import 'package:rest_sample/core/network/dio_client.dart' as _i991;
import 'package:rest_sample/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i417;
import 'package:rest_sample/features/auth/data/repositories/auth_repository_impl.dart'
    as _i52;
import 'package:rest_sample/features/auth/domain/repositories/auth_repository.dart'
    as _i1072;
import 'package:rest_sample/features/auth/domain/usecases/login_usecase.dart'
    as _i652;
import 'package:rest_sample/features/auth/domain/usecases/register_usecase.dart'
    as _i152;
import 'package:rest_sample/features/auth/presentation/bloc/auth_bloc.dart'
    as _i364;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i191.ApiClient>(() => _i991.DioClient(dio: gh<_i361.Dio>()));
    gh.factory<_i417.AuthRemoteDataSource>(
      () => _i417.AuthRemoteDataSource(gh<_i191.ApiClient>()),
    );
    gh.factory<_i1072.AuthRepository>(
      () => _i52.AuthRepositoryImpl(gh<_i417.AuthRemoteDataSource>()),
    );
    gh.factory<_i652.LoginUseCase>(
      () => _i652.LoginUseCase(gh<_i1072.AuthRepository>()),
    );
    gh.factory<_i152.RegisterUseCase>(
      () => _i152.RegisterUseCase(gh<_i1072.AuthRepository>()),
    );
    gh.factory<_i364.AuthBloc>(
      () =>
          _i364.AuthBloc(gh<_i152.RegisterUseCase>(), gh<_i652.LoginUseCase>()),
    );
    return this;
  }
}
