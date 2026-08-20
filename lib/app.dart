import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_sample/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rest_sample/features/auth/presentation/bloc/auth_state.dart';
import 'package:rest_sample/features/auth/presentation/pages/login_page.dart';

import 'core/di/di.dart';
import 'core/extensions/navigation_ext.dart';
import 'features/splash/presentation/pages/splash_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  final authBloc = di<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>.value(
      value: authBloc,
      child: MaterialApp(
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
          ),
        ),
        builder: (context, child){
          return BlocListener<AuthBloc, AuthState>(
            bloc: authBloc,
            listener: (context, state) {
              if (state.authStatus == AuthStatus.unauthenticated) {
                context.pushReplacement(LoginPage());
              }
            },
            child: child,
          );
        },
        home: SplashPage(),
      ),
    );
  }
}
