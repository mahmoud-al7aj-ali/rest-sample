import 'package:flutter/material.dart';
import 'package:rest_sample/features/auth/presentation/pages/login_page.dart';
import 'package:rest_sample/features/auth/presentation/pages/register_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
      ),
      home: RegisterPage(),
    );
  }
}
