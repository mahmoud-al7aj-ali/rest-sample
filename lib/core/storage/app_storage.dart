
import 'package:injectable/injectable.dart';
import 'package:rest_sample/core/storage/secure_storage.dart';
import 'package:rest_sample/core/storage/unsecure_storage.dart';

@lazySingleton
class AppStorage {
  final SecureStorage _secureStorage;
  final UnsecureStorage _unsecureStorage;

  AppStorage(this._secureStorage, this._unsecureStorage);


  Future<String?> readSecure(String key) {
    return _secureStorage.read(key);
  }

  Future<T?> readUnsecure<T>(String key) {
    return _unsecureStorage.read<T>(key);
  }

  Future<void> writeSecure({required String key, required String? value}) {
    return _secureStorage.write(key: key, value: value);
  }

  Future<void> writeUnSecure<T>({required String key, required T value}) {
    return _unsecureStorage.write<T>(key: key, value: value);
  }

  Future<void> clearSecure(String key) {
    return _secureStorage.clear(key);
  }

  Future<void> clearUnSecure(String key) {
    return _unsecureStorage.clear(key);
  }

}