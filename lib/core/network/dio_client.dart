import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rest_sample/core/enums/methods_enum.dart';
import 'package:rest_sample/core/network/api_client.dart';
import 'package:rest_sample/core/network/app_reponse.dart';

@Injectable(as: ApiClient)
class DioClient extends ApiClient{
  final Dio dio;
  DioClient({required this.dio});

  @override
  Future<AppResponse> request({required String url, required Method method, Object? data}) async {
    final response = await dio.request(url, options: Options(method: method.name),data: data);
    if(response.statusCode != 200){
      throw Exception(response.data);
    }
    return AppResponse(data: response.data);
  }

}