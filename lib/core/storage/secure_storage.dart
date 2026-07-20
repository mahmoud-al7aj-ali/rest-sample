import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecureStorage {
  final _instance = FlutterSecureStorage();

  Future<String?> read(String key){
    return _instance.read(key: key);
  }

  Future<void> write({required String key, required String? value}){
    return _instance.write(key: key,value: value);
  }

  Future<void> clear(String key){
    return _instance.delete(key: key);
  }

}