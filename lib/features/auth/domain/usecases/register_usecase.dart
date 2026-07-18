import 'package:injectable/injectable.dart';
import 'package:rest_sample/core/network/app_request.dart';
import 'package:rest_sample/features/auth/domain/entities/user.dart';
import 'package:rest_sample/features/auth/domain/repositories/auth_repository.dart';

@injectable
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<User> call({RegisterRequest? request}){
    return repository.register(request: request);
  }

}

class RegisterRequest extends AppRequest{
  final String name;
  final String email;
  final String password;

  RegisterRequest({required this.name, required this.email, required this.password});

  @override
  Map<String, dynamic> get data => {
    "name": name,
    "email": email,
    "password": password,
  };

}