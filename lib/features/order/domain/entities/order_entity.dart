// features/order/domain/entities/order_entity.dart
import 'package:equatable/equatable.dart';

enum OrderStatus {
  pending,
  confirmed,
  preparing,
  ready,
  completed,
  cancelled,
}

class OrderEntity extends Equatable {
  final String id;
  final String customerId;
  final String restaurantId;
  final List<Map<String, dynamic>> items;
  final double totalAmount;
  final DateTime orderDate;
  final OrderStatus status;

  const OrderEntity({
    required this.id,
    required this.customerId,
    required this.restaurantId,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    required this.status,
  });

  @override
  List<Object> get props => [
        id,
        customerId,
        restaurantId,
        items,
        totalAmount,
        orderDate,
        status,
      ];

  copyWith({required OrderStatus status}) {}
}
