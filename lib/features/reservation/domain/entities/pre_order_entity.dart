import 'package:equatable/equatable.dart';

enum PreOrderStatus {
  pending,
  preparing,
  ready,
  completed,
  cancelled
}

class PreOrderItem extends Equatable {
  final String menuItemId;
  final String name;
  final double price;
  final int quantity;
  final String? specialInstructions;

  const PreOrderItem({
    required this.menuItemId,
    required this.name,
    required this.price,
    required this.quantity,
    this.specialInstructions,
  });

  @override
  List<Object?> get props => [
        menuItemId,
        name,
        price,
        quantity,
        specialInstructions,
      ];
}

class PreOrder extends Equatable {
  final String id;
  final String customerId;
  final String restaurantId;
  final List<PreOrderItem> items;
  final DateTime pickupTime;
  final PreOrderStatus status;
  final String? specialInstructions;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PreOrder({
    required this.id,
    required this.customerId,
    required this.restaurantId,
    required this.items,
    required this.pickupTime,
    required this.status,
    this.specialInstructions,
    required this.createdAt,
    required this.updatedAt,
  });

  PreOrder copyWith({
    String? id,
    String? customerId,
    String? restaurantId,
    List<PreOrderItem>? items,
    DateTime? pickupTime,
    PreOrderStatus? status,
    String? specialInstructions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PreOrder(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      restaurantId: restaurantId ?? this.restaurantId,
      items: items ?? this.items,
      pickupTime: pickupTime ?? this.pickupTime,
      status: status ?? this.status,
      specialInstructions: specialInstructions ?? this.specialInstructions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  double get totalAmount {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  List<Object?> get props => [
        id,
        customerId,
        restaurantId,
        items,
        pickupTime,
        status,
        specialInstructions,
        createdAt,
        updatedAt,
      ];
}