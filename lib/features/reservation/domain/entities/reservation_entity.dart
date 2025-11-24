import 'package:equatable/equatable.dart';

enum ReservationStatus {
  pending,
  confirmed,
  declined,
  completed,
  cancelled
}

class Reservation extends Equatable {
  final String id;
  final String customerId;
  final String restaurantId;
  final DateTime dateTime;
  final int partySize;
  final ReservationStatus status;
  final String? specialRequests;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Reservation({
    required this.id,
    required this.customerId,
    required this.restaurantId,
    required this.dateTime,
    required this.partySize,
    required this.status,
    this.specialRequests,
    required this.createdAt,
    required this.updatedAt,
  });

  Reservation copyWith({
    String? id,
    String? customerId,
    String? restaurantId,
    DateTime? dateTime,
    int? partySize,
    ReservationStatus? status,
    String? specialRequests,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Reservation(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      restaurantId: restaurantId ?? this.restaurantId,
      dateTime: dateTime ?? this.dateTime,
      partySize: partySize ?? this.partySize,
      status: status ?? this.status,
      specialRequests: specialRequests ?? this.specialRequests,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        customerId,
        restaurantId,
        dateTime,
        partySize,
        status,
        specialRequests,
        createdAt,
        updatedAt,
      ];
}