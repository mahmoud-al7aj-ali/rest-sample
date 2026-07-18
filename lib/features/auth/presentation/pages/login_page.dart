import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_sample/core/components/text_field_widget.dart';
import 'package:rest_sample/core/extensions/context_ext.dart';
import 'package:rest_sample/core/extensions/navigation_ext.dart';
import 'package:rest_sample/core/extensions/num_ext.dart';
import 'package:rest_sample/core/utils/app_validator.dart';
import 'package:rest_sample/features/auth/domain/usecases/login_usecase.dart';
import 'package:rest_sample/features/auth/presentation/bloc/auth_event.dart';
import 'package:rest_sample/features/auth/presentation/bloc/auth_state.dart';
import 'package:rest_sample/features/auth/presentation/pages/register_page.dart';
import 'package:rest_sample/features/home/presentation/pages/home_page.dart';

import '../bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  late final authBloc = context.read<AuthBloc>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state.user != null){
          print("welcome: ${state.user!.name}");
          context.pushReplacement(HomePage());
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: form,
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                children: [
                  Center(
                    child: Text(
                      "Login Screen",
                      style: TextTheme
                          .of(context)
                          .headlineLarge,
                    ),
                  ),
                  116.vs,
                  TextFieldWidget(
                    label: "Email",
                    controller: emailController,
                    validator: AppValidator.emailValidator,
                  ),
                  16.vs,
                  TextFieldWidget(
                    label: "Password",
                    controller: passwordController,
                    validator: AppValidator.passwordValidator,
                  ),
                  24.vs,
                  Center(
                    child: BlocSelector<AuthBloc, AuthState, bool>(
                      selector: (state) => state.isLoading,
                      builder: (context, isLoading) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                            // backgroundColor: Theme.of(context).colorScheme.primary,
                            backgroundColor: context.colorScheme.primary,
                            foregroundColor: context.colorScheme.onPrimary,
                          ),
                          onPressed: isLoading ? null : () {
                            if (form.currentState!.validate()) {
                              authBloc.add(
                                AuthLoginEvent(
                                  request: LoginRequest(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                            }
                          },
                          child: isLoading ? CircularProgressIndicator() : Text("Login"),
                        );
                      },
                    ),
                  ),
                  16.vs,
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: context.colorScheme.onSurface),
                        text: "Don't have account? ",
                        children: [
                          TextSpan(
                            text: "Register",
                            style: TextStyle(color: context.colorScheme.primary, fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushReplacement(RegisterPage());
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
