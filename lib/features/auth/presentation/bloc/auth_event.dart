import 'package:rest_sample/features/auth/domain/usecases/login_usecase.dart';
import 'package:rest_sample/features/auth/domain/usecases/register_usecase.dart';

abstract class AuthEvent {}

class AuthRegisterEvent extends AuthEvent{
  final RegisterRequest request;

  AuthRegisterEvent({required this.request});
}

class AuthLoginEvent extends AuthEvent{
  final LoginRequest request;

  AuthLoginEvent({required this.request});
}