import '../enums/methods_enum.dart';
import 'app_reponse.dart';

abstract class ApiClient {

  Future<AppResponse> request({required String url, required Method method, Object? data});

}