import 'package:flutter/material.dart';
import 'package:rest_sample/core/di/di.dart';
import 'package:rest_sample/core/extensions/navigation_ext.dart';
import 'package:rest_sample/core/storage/app_storage.dart';
import 'package:rest_sample/core/storage/storage_keys.dart';
import 'package:rest_sample/features/auth/presentation/pages/login_page.dart';
import 'package:rest_sample/features/home/presentation/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkLoggedIn();
  }

  Future<void> checkLoggedIn() async {
    final appStorage = di<AppStorage>();
    await Future.delayed(Duration(seconds: 1));
    final isLoggedIn = await appStorage.readUnsecure<bool>(StorageKeys.isLoggedInKey);
    if (context.mounted) {
      if (isLoggedIn == true) {
        context.pushReplacement(HomePage());
      } else {
        context.pushReplacement(LoginPage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 200,
        ),
      ),
    );
  }
}
