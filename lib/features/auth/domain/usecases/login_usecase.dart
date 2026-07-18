import 'package:injectable/injectable.dart';
import 'package:rest_sample/core/network/app_request.dart';
import 'package:rest_sample/features/auth/domain/entities/user.dart';
import 'package:rest_sample/features/auth/domain/repositories/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> call({LoginRequest? request}){
    return repository.login(request: request);
  }

}

class LoginRequest extends AppRequest{
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  @override
  Map<String, dynamic> get data => {
    "email": email,
    "password": password,
  };

}