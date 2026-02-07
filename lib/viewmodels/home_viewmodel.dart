import 'package:flutter/material.dart';
import '../views/services_view.dart';
import '../views/about_view.dart';

class HomeViewModel {
  String get introText =>
      'Bangalore\'s trusted taxi service. Founded in 2024, we specialize in seamless airport pickups, intercity rides, and outstation trips. Available 24/7 with safe, reliable, and affordable transportation.';

  String get tagline => 'Safe, Reliable & Affordable Rides';

  void goToServices(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ServicesView()),
    );
  }

  void goToAbout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AboutView()),
    );
  }
}