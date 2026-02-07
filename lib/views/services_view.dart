import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/services_viewmodel.dart';
import '../widgets/service_card.dart';
import 'home_view.dart';
import 'about_view.dart';
import 'bookings_list_view.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ServicesViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Our Services'),
          backgroundColor: const Color(0xFF2196F3),
          foregroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: Consumer<ServicesViewModel>(
          builder: (context, vm, _) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: vm.services.length,
              itemBuilder: (_, index) {
                final service = vm.services[index];
                return ServiceCard(service: service);
              },
            );
          },
        ),
        bottomNavigationBar: _buildBottomNav(context, 1),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    selectedItemColor: const Color(0xFF2196F3),
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    onTap: (index) {
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeView()),
        );
      } else if (index == 1 && currentIndex != 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ServicesView()),
        );
      } else if (index == 2 && currentIndex != 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AboutView()),
        );
      } else if (index == 3) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const BookingsListView()),
        );
      }
    },
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Services'),
      BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
      BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'Bookings'),
    ],
  );
}
}