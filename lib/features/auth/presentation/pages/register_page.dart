import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_sample/core/components/text_field_widget.dart';
import 'package:rest_sample/core/di/di.dart';
import 'package:rest_sample/core/extensions/context_ext.dart';
import 'package:rest_sample/core/extensions/navigation_ext.dart';
import 'package:rest_sample/core/extensions/num_ext.dart';
import 'package:rest_sample/core/utils/app_validator.dart';
import 'package:rest_sample/features/auth/domain/usecases/register_usecase.dart';
import 'package:rest_sample/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rest_sample/features/auth/presentation/bloc/auth_event.dart';
import 'package:rest_sample/features/auth/presentation/bloc/auth_state.dart';
import 'package:rest_sample/features/auth/presentation/pages/login_page.dart';
import 'package:rest_sample/features/home/presentation/pages/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  late final authBloc = context.read<AuthBloc>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state.authStatus == AuthStatus.authenticated){
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Register Screen",
                      style: TextTheme
                          .of(context)
                          .headlineLarge,
                    ),
                  ),
                  116.vs,
                  TextFieldWidget(
                    label: "Name",
                    controller: nameController,
                    validator: (value) => AppValidator.requiredValidator(value, "Name"),
                  ),
                  16.vs,
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
                  BlocSelector<AuthBloc, AuthState, String?>(
                    selector: (state) => state.errorMsg,
                    builder: (context, error) {
                      if (error == null) return SizedBox.shrink();
                      return Column(
                        children: [
                          Text(error, maxLines: 2,),
                          24.vs,
                        ],
                      );
                    },
                  ),
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
                          onPressed: isLoading
                              ? null
                              : () {
                            if (form.currentState!.validate()) {
                              authBloc.add(
                                AuthRegisterEvent(
                                  request: RegisterRequest(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                            }
                          },
                          child: isLoading ? CircularProgressIndicator() : Text("Register"),
                        );
                      },
                    ),
                  ),
                  16.vs,
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: context.colorScheme.onSurface),
                        text: "Do you have account? ",
                        children: [
                          TextSpan(
                            text: "Login",
                            style: TextStyle(color: context.colorScheme.primary, fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushReplacement(LoginPage());
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
