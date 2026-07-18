import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_sample/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rest_sample/features/auth/presentation/pages/login_page.dart';
import 'package:rest_sample/features/auth/presentation/pages/register_page.dart';

import 'core/di/di.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AuthBloc>(),
      child: MaterialApp(
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
          ),
        ),
        home: RegisterPage(),
      ),
    );
  }
}
