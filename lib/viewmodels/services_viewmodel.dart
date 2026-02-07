import 'package:flutter/material.dart';
import '../models/service_model.dart';

class ServicesViewModel extends ChangeNotifier {
  final List<ServiceModel> services = [
    ServiceModel(
      title: 'Airport Pickup & Drop',
      description: 'Seamless airport transfers with timely pickups. Available 24/7 for your convenience.',
    ),
    ServiceModel(
      title: 'Outstation Rides',
      description: 'Comfortable long-distance travel to Mysore, Coorg, and other destinations across Karnataka.',
    ),
    ServiceModel(
      title: 'Local City Rides',
      description: 'Quick and reliable rides within Bangalore for daily commuting and errands.',
    ),
    ServiceModel(
      title: 'Intercity Cab Services',
      description: 'Travel between cities with professional drivers and well-maintained vehicles.',
    ),
    ServiceModel(
      title: 'Corporate Services',
      description: 'Tailored transportation solutions for businesses, meetings, events, and conferences.',
    ),
    ServiceModel(
      title: 'Hourly Rentals',
      description: 'Book our cabs by the hour for multiple stops and flexible scheduling.',
    ),
  ];
}