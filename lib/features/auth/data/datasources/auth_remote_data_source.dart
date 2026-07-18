import 'package:injectable/injectable.dart';
import 'package:rest_sample/core/constants/app_constants.dart';
import 'package:rest_sample/core/constants/end_points.dart';
import 'package:rest_sample/core/enums/methods_enum.dart';
import 'package:rest_sample/core/network/api_client.dart';
import 'package:rest_sample/core/network/app_request.dart';
import 'package:rest_sample/features/auth/data/models/user_model.dart';

@injectable
class AuthRemoteDataSource {
  final ApiClient client;

  AuthRemoteDataSource(this.client);

  Future<UserModel> register({AppRequest? appRequest}) async {
    final response = await client.request(
      url: EndPoints.register,
      method: Method.post,
      data: appRequest?.data
    );
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> login({AppRequest? appRequest}) async {
    final response = await client.request(
      url: EndPoints.login,
      method: Method.post,
      data: appRequest?.data
    );
    return UserModel.fromJson(response.data);
  }
}
