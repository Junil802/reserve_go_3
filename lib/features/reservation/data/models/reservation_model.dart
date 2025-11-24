import '../../domain/entities/reservation_entity.dart';

class ReservationModel extends Reservation {
  const ReservationModel({
    required super.id,
    required super.customerId,
    required super.restaurantId,
    required super.dateTime,
    required super.partySize,
    required super.status,
    super.specialRequests,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      restaurantId: json['restaurantId'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      partySize: json['partySize'] as int,
      status: ReservationStatus.values.firstWhere((e) => e.name == json['status']),
      specialRequests: json['specialRequests'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'restaurantId': restaurantId,
      'dateTime': dateTime.toIso8601String(),
      'partySize': partySize,
      'status': status.name,
      'specialRequests': specialRequests,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}