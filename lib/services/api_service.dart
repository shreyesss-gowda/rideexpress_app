import 'dart:convert';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../models/booking_model.dart';

class ApiService {
  // Auto-detect platform and use appropriate URL
  static String get baseUrl {
    if (kIsWeb) {
      // For Chrome/Web - Use localhost
      return 'http://localhost:3000/api';
    } else if (Platform.isAndroid) {
      // For Android Emulator - Use 10.0.2.2
      // For Android Real Device - Replace with your computer's IP (e.g., 'http://192.168.1.100:3000/api')
      return 'http://10.0.2.2:3000/api';
    } else if (Platform.isIOS) {
      // For iOS Simulator - Use localhost
      // For iOS Real Device - Replace with your computer's IP (e.g., 'http://192.168.1.100:3000/api')
      return 'http://localhost:3000/api';
    } else {
      // Fallback
      return 'http://localhost:3000/api';
    }
  }

  // CREATE
  Future<Map<String, dynamic>> createBooking(BookingModel booking) async {
    try {
      final response = await http
          .post(
            Uri.parse('$baseUrl/bookings'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(booking.toJson()),
          )
          .timeout(const Duration(seconds: 10));

      final data = jsonDecode(response.body);

      if (response.statusCode == 201) {
        return {'success': true, 'data': data['data']};
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Failed to create booking'
        };
      }
    } on http.ClientException catch (e) {
      return {
        'success': false,
        'message': 'Connection failed. Please check if backend is running.',
        'Network error': '$e'
      };
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  // READ ALL
  Future<Map<String, dynamic>> getAllBookings() async {
    try {
      final response = await http
          .get(
            Uri.parse('$baseUrl/bookings'),
            headers: {'Content-Type': 'application/json'},
          )
          .timeout(const Duration(seconds: 10));

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<BookingModel> bookings = (data['data'] as List)
            .map((json) => BookingModel.fromJson(json))
            .toList();
        return {'success': true, 'data': bookings};
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Failed to fetch bookings'
        };
      }
    } on http.ClientException catch (e) {
      return {
        'success': false,
        'message': 'Connection failed. Please check if backend is running.',
        'Network error': '$e'
      };
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  // READ ONE
  Future<Map<String, dynamic>> getBookingById(String id) async {
    try {
      final response = await http
          .get(
            Uri.parse('$baseUrl/bookings/$id'),
            headers: {'Content-Type': 'application/json'},
          )
          .timeout(const Duration(seconds: 10));

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {'success': true, 'data': BookingModel.fromJson(data['data'])};
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Failed to fetch booking'
        };
      }
    } on http.ClientException catch (e) {
      return {
        'success': false,
        'message': 'Connection failed. Please check if backend is running.',
        'Network error': '$e'
      };
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  // UPDATE
  Future<Map<String, dynamic>> updateBooking(
      String id, BookingModel booking) async {
    try {
      final response = await http
          .put(
            Uri.parse('$baseUrl/bookings/$id'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(booking.toJson()),
          )
          .timeout(const Duration(seconds: 10));

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {'success': true, 'data': data['data']};
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Failed to update booking'
        };
      }
    } on http.ClientException catch (e) {
      return {
        'success': false,
        'message': 'Connection failed. Please check if backend is running.',
        'Network error': '$e'
      };
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  // DELETE
  Future<Map<String, dynamic>> deleteBooking(String id) async {
    try {
      final response = await http
          .delete(
            Uri.parse('$baseUrl/bookings/$id'),
            headers: {'Content-Type': 'application/json'},
          )
          .timeout(const Duration(seconds: 10));

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {'success': true, 'message': data['message']};
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Failed to delete booking'
        };
      }
    } on http.ClientException catch (e) {
      return {
        'success': false,
        'message': 'Connection failed. Please check if backend is running.',
        'Network error': '$e'
      };
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  // Health check to test connection
  Future<bool> checkConnection() async {
    try {
      final response = await http
          .get(Uri.parse('${baseUrl.replaceAll('/api', '')}/api/health'))
          .timeout(const Duration(seconds: 5));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}