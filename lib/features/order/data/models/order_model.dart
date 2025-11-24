// features/order/data/models/order_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required String id,
    required String customerId,
    required String restaurantId,
    required List<Map<String, dynamic>> items,
    required double totalAmount,
    required DateTime orderDate,
    required OrderStatus status,
  }) : super(
          id: id,
          customerId: customerId,
          restaurantId: restaurantId,
          items: items,
          totalAmount: totalAmount,
          orderDate: orderDate,
          status: status,
        );

  /// Factory: Convert Entity → Model
  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      customerId: entity.customerId,
      restaurantId: entity.restaurantId,
      items: entity.items,
      totalAmount: entity.totalAmount,
      orderDate: entity.orderDate,
      status: entity.status,
    );
  }

  /// Factory: Firestore Document → Model
  factory OrderModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return OrderModel(
      id: doc.id,
      customerId: data['customerId'] ?? '',
      restaurantId: data['restaurantId'] ?? '',
      items: List<Map<String, dynamic>>.from(data['items'] ?? []),
      totalAmount: (data['totalAmount'] as num?)?.toDouble() ?? 0.0,
      orderDate: _parseDate(data['orderDate']),
      status: _parseOrderStatus(data['status']),
    );
  }

  /// Factory: JSON → Model
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? '',
      customerId: json['customerId'] ?? '',
      restaurantId: json['restaurantId'] ?? '',
      items: List<Map<String, dynamic>>.from(json['items'] ?? []),
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
      orderDate: _parseDate(json['orderDate']),
      status: _parseOrderStatus(json['status']),
    );
  }

  /// Convert Model → JSON
  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'restaurantId': restaurantId,
      'items': items,
      'totalAmount': totalAmount,
      'orderDate': Timestamp.fromDate(orderDate),
      'status': status.name,
    };
  }

  /// Convert Model → Firestore Document (alias for toJson)
  Map<String, dynamic> toDocument() {
    return toJson();
  }

  /// Helper: Parse Date from Timestamp, String, or DateTime
  static DateTime _parseDate(dynamic date) {
    if (date == null) return DateTime.now();
    if (date is DateTime) return date;
    if (date is Timestamp) return date.toDate();
    if (date is String) {
      try {
        return DateTime.parse(date);
      } catch (_) {
        return DateTime.now();
      }
    }
    return DateTime.now();
  }

  /// Helper: Parse OrderStatus from String
  static OrderStatus _parseOrderStatus(dynamic status) {
    if (status == null) return OrderStatus.pending;
    final statusString = status.toString().toLowerCase();
    switch (statusString) {
      case 'pending':
        return OrderStatus.pending;
      case 'confirmed':
        return OrderStatus.confirmed;
      case 'preparing':
        return OrderStatus.preparing;
      case 'ready':
        return OrderStatus.ready;
      case 'completed':
        return OrderStatus.completed;
      case 'cancelled':
      case 'canceled':
        return OrderStatus.cancelled;
      default:
        return OrderStatus.pending;
    }
  }
}
