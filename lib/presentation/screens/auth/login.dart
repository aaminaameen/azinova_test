import 'package:azinova/presentation/router/router.dart';
import 'package:azinova/presentation/style/color_constant.dart';
import 'package:azinova/presentation/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../style/constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> authenticate(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final String username = usernameController.text;
      final String password = passwordController.text;

      if (username == 'admin' && password == 'admin') {
        context.goNamed(RouterPath.home);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: ColorPalette.grey.withOpacity(.9),
              title: const Text('Authentication Error'),
              content: const Text('Invalid username or password'),
              actions: <Widget>[
                ElevatedButton(
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorPalette.black.withOpacity(.9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 30,
                  color: ColorPalette.black.withOpacity(.9),
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight100,
              CustomTextFormField(
                controller: usernameController,
                hintText: 'Username',
                prefixIcon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              kHeight15,
              CustomTextFormField(
                controller: passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              kHeight50,
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(25),
                  backgroundColor: MaterialStateProperty.all<Color?>(
                    ColorPalette.black,
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(double.infinity, 48),
                  ),
                ),
                onPressed: () => authenticate(context),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: ColorPalette.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
