class BookingModel {
  final String? id;
  final String name;
  final String phone;
  final String email;
  final String serviceType;
  final String pickupLocation;
  final String dropLocation;
  final DateTime pickupDate;
  final String pickupTime;
  final String notes;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BookingModel({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.serviceType,
    required this.pickupLocation,
    required this.dropLocation,
    required this.pickupDate,
    required this.pickupTime,
    this.notes = '',
    this.status = 'pending',
    this.createdAt,
    this.updatedAt,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      serviceType: json['serviceType'],
      pickupLocation: json['pickupLocation'],
      dropLocation: json['dropLocation'],
      pickupDate: DateTime.parse(json['pickupDate']),
      pickupTime: json['pickupTime'],
      notes: json['notes'] ?? '',
      status: json['status'] ?? 'pending',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'serviceType': serviceType,
      'pickupLocation': pickupLocation,
      'dropLocation': dropLocation,
      'pickupDate': pickupDate.toIso8601String(),
      'pickupTime': pickupTime,
      'notes': notes,
      'status': status,
    };
  }
}