import 'package:flutter/cupertino.dart';
import 'package:rest_sample/app.dart';
import 'package:rest_sample/core/di/di.dart';
import 'package:rest_sample/core/storage/storage_keys.dart';
import 'package:rest_sample/core/storage/unsecure_storage.dart';

void main(){
  configureDependencies();
  runApp(App());
}