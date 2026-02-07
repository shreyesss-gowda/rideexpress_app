import 'package:flutter/material.dart';
import '../models/booking_model.dart';
import '../services/api_service.dart';

class BookingsViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<BookingModel> _bookings = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<BookingModel> get bookings => _bookings;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch all bookings
  Future<void> fetchBookings() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    final result = await _apiService.getAllBookings();

    if (result['success']) {
      _bookings = result['data'];
    } else {
      _errorMessage = result['message'];
    }

    _isLoading = false;
    notifyListeners();
  }

  // Create booking
  Future<bool> createBooking(BookingModel booking) async {
    _isLoading = true;
    notifyListeners();

    final result = await _apiService.createBooking(booking);

    _isLoading = false;
    
    if (result['success']) {
      await fetchBookings(); // Refresh list
      notifyListeners();
      return true;
    } else {
      _errorMessage = result['message'];
      notifyListeners();
      return false;
    }
  }

  // Update booking
  Future<bool> updateBooking(String id, BookingModel booking) async {
    _isLoading = true;
    notifyListeners();

    final result = await _apiService.updateBooking(id, booking);

    _isLoading = false;

    if (result['success']) {
      await fetchBookings(); // Refresh list
      notifyListeners();
      return true;
    } else {
      _errorMessage = result['message'];
      notifyListeners();
      return false;
    }
  }

  // Delete booking
  Future<bool> deleteBooking(String id) async {
    _isLoading = true;
    notifyListeners();

    final result = await _apiService.deleteBooking(id);

    _isLoading = false;

    if (result['success']) {
      await fetchBookings(); // Refresh list
      notifyListeners();
      return true;
    } else {
      _errorMessage = result['message'];
      notifyListeners();
      return false;
    }
  }
}