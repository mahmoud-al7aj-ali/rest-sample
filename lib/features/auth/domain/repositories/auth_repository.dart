import 'package:rest_sample/core/network/app_request.dart';
import 'package:rest_sample/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> register({AppRequest? request});
  Future<User> login({AppRequest? request});
}