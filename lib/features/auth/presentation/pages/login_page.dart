import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rest_sample/core/components/text_field_widget.dart';
import 'package:rest_sample/core/extensions/context_ext.dart';
import 'package:rest_sample/core/extensions/navigation_ext.dart';
import 'package:rest_sample/core/extensions/num_ext.dart';
import 'package:rest_sample/features/auth/presentation/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                Center(
                  child: Text(
                    "Login Screen",
                    style: TextTheme.of(context).headlineLarge,
                  ),
                ),
                116.vs,
                TextFieldWidget(
                  label: "Email",
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.[a-zA-Z]{2,}$")
                        .hasMatch(value);
                    if (!emailValid) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                16.vs,
                TextFieldWidget(
                  label: "Password",
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return "Password is required";
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
                      if(form.currentState!.validate()){
                        print("All fields are valid");
                      }
                    },
                    child: Text("Login"),
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
    );
  }
}
