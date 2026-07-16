import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSource(this.dio);

}