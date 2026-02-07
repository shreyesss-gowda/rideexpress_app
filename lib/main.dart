import 'package:flutter/material.dart';
import 'views/splash_view.dart';

void main() {
  runApp(const RidExpressApp());
}

class RidExpressApp extends StatelessWidget {
  const RidExpressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RidExpress - Taxi Services',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196F3),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: const SplashView(),
    );
  }
}