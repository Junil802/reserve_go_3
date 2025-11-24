import '../../domain/entities/pre_order_entity.dart';

class PreOrderItemModel extends PreOrderItem {
  const PreOrderItemModel({
    required super.menuItemId,
    required super.name,
    required super.price,
    required super.quantity,
    super.specialInstructions,
  });

  factory PreOrderItemModel.fromJson(Map<String, dynamic> json) {
    return PreOrderItemModel(
      menuItemId: json['menuItemId'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      specialInstructions: json['specialInstructions'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuItemId': menuItemId,
      'name': name,
      'price': price,
      'quantity': quantity,
      'specialInstructions': specialInstructions,
    };
  }
}

class PreOrderModel extends PreOrder {
  const PreOrderModel({
    required super.id,
    required super.customerId,
    required super.restaurantId,
    required List<PreOrderItemModel> items,
    required super.pickupTime,
    required super.status,
    super.specialInstructions,
    required super.createdAt,
    required super.updatedAt,
  }) : super(items: items);

  factory PreOrderModel.fromJson(Map<String, dynamic> json) {
    return PreOrderModel(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      restaurantId: json['restaurantId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((item) => PreOrderItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      pickupTime: DateTime.parse(json['pickupTime'] as String),
      status: PreOrderStatus.values.firstWhere((e) => e.name == json['status']),
      specialInstructions: json['specialInstructions'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'restaurantId': restaurantId,
      'items': items.map((item) => (item as PreOrderItemModel).toJson()).toList(),
      'pickupTime': pickupTime.toIso8601String(),
      'status': status.name,
      'specialInstructions': specialInstructions,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}