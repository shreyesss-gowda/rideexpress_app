import 'dart:async';
import 'package:flutter/material.dart';
import '../views/home_view.dart';

class SplashViewModel {
  void navigateToHome(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeView()),
      );
    });
  }
}