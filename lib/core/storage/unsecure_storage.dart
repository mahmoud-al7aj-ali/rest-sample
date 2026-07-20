
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class UnsecureStorage {
  final _instance = SharedPreferencesAsync();

  Future<T?> read<T>(String key) async {
    if(T == int){
      return _instance.getInt(key) as Future<T?>;
    } else if(T == bool){
      return _instance.getBool(key) as Future<T?>;
    } else if(T == String){
      return _instance.getString(key) as Future<T?>;
    } else if(T == double){
      return _instance.getDouble(key) as Future<T?>;
    }
    throw "$T type is not handled";
  }


  Future<void> write<T>({required String key, required T value}){
    if(T == int){
      return _instance.setInt(key,value as int);
    } else if(T == bool){
      return _instance.setBool(key,value as bool);
    } else if(T == String){
      return _instance.setString(key, value as String);
    } else if(T == double){
      return _instance.setDouble(key, value as double);
    }
    throw "$T is not handled";
  }

  Future<void> clear(String key){
    return _instance.remove(key);
  }

}