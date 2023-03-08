import 'package:flutter/material.dart';
import 'package:tasks/pages/splash_home_page/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.purple)),
    );
  }
}
