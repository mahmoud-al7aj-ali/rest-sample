import 'package:flutter/material.dart';
import 'package:rest_sample/core/di/di.dart';
import 'package:rest_sample/core/extensions/navigation_ext.dart';
import 'package:rest_sample/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rest_sample/features/auth/presentation/bloc/auth_event.dart';
import 'package:rest_sample/features/auth/presentation/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              di<AuthBloc>().add(AuthLogoutEvent());
              context.pushReplacement(LoginPage());
            },
            icon: Icon(Icons.logout_rounded),
          ),
        ],
      ),
    );
  }
}
