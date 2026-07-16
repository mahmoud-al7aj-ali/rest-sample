import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rest_sample/core/components/text_field_widget.dart';
import 'package:rest_sample/core/extensions/context_ext.dart';
import 'package:rest_sample/core/extensions/navigation_ext.dart';
import 'package:rest_sample/core/extensions/num_ext.dart';
import 'package:rest_sample/features/auth/presentation/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: TextTheme.of(context).headlineLarge,
                  ),
                ),
                116.vs,
                TextFieldWidget(
                  label: "Name",
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
                16.vs,
                TextFieldWidget(
                  label: "Email",
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.[a-zA-Z]{2,}$",
                    ).hasMatch(value);
                    if (!emailValid) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                16.vs,
                TextFieldWidget(
                  label: "Password",
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                24.vs,
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                      // backgroundColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: context.colorScheme.primary,
                      foregroundColor: context.colorScheme.onPrimary,
                    ),
                    onPressed: () {
                      if (form.currentState!.validate()) {
                        print("Registration successful");
                      }
                    },
                    child: Text("Register"),
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
    );
  }
}
