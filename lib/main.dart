import 'package:flutter/cupertino.dart';
import 'package:rest_sample/app.dart';
import 'package:rest_sample/core/di/di.dart';

void main(){
  configureDependencies();
  runApp(App());
}