import 'package:azinova/presentation/router/router.dart';
import 'package:azinova/presentation/style/color_constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Azinova',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorPalette.white,
          background: ColorPalette.white,
        ),
      ),
      routerConfig: router,
    );
  }
}