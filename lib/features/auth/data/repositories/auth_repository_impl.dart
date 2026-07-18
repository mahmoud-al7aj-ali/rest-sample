import 'package:injectable/injectable.dart';
import 'package:rest_sample/core/network/app_request.dart';
import 'package:rest_sample/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rest_sample/features/auth/domain/entities/user.dart';
import 'package:rest_sample/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository{
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> register({AppRequest? request}) {
    return remoteDataSource.register(appRequest: request);
  }

  @override
  Future<User> login({AppRequest? request}) {
    return remoteDataSource.login(appRequest: request);
  }

}