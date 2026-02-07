import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/splash_view.dart';
import 'viewmodels/bookings_viewmodel.dart';

void main() {
  runApp(const RidExpressApp());
}

class RidExpressApp extends StatelessWidget {
  const RidExpressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookingsViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RidExpress - Taxi Services',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF2196F3),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Roboto',
        ),
        home: const SplashView(),
      ),
    );
  }
}