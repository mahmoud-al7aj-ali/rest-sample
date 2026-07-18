import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rest_sample/core/constants/app_constants.dart';

import 'di.config.dart';

final di = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  final dio = Dio(BaseOptions(
    baseUrl: AppConstants.baseUrl,
    validateStatus: (code) => true
  ));
  di.registerSingleton<Dio>(dio);
  di.init();
}


