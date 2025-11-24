// features/order/data/datasources/order_remote_data_source.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/order_model.dart';
import '../../domain/entities/order_entity.dart';

abstract class OrderRemoteDataSource {
  Future<OrderModel> createOrder(OrderModel order);
  Future<OrderModel> updateOrder(OrderModel order);
  Future<OrderModel> getOrderById(String id);
  Future<List<OrderEntity>> getOrdersByCustomerId(String customerId);
  Future<List<OrderEntity>> getOrdersByRestaurantId(String restaurantId);
  Future<List<OrderEntity>> getOrdersByStatus(OrderStatus status);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  @override
  Future<OrderModel> createOrder(OrderModel order) async {
    await Future.delayed(Duration(milliseconds: 500));
    return order;
  }

  @override
  Future<OrderModel> updateOrder(OrderModel order) async {
    await Future.delayed(Duration(milliseconds: 500));
    return order;
  }

  @override
  Future<OrderModel> getOrderById(String id) async {
    await Future.delayed(Duration(milliseconds: 500));
    return OrderModel(
      id: id,
      customerId: 'customer_123',
      restaurantId: 'restaurant_123',
      items: [],
      totalAmount: 0.0,
      orderDate: DateTime.now(),
      status: OrderStatus.pending,
    );
  }

  @override
  Future<List<OrderEntity>> getOrdersByCustomerId(String customerId) async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      OrderModel(
        id: 'order_1',
        customerId: customerId,
        restaurantId: 'restaurant_1',
        items: [],
        totalAmount: 25.99,
        orderDate: DateTime.now().subtract(Duration(days: 1)),
        status: OrderStatus.completed,
      ),
      OrderModel(
        id: 'order_2',
        customerId: customerId,
        restaurantId: 'restaurant_2',
        items: [],
        totalAmount: 35.50,
        orderDate: DateTime.now(),
        status: OrderStatus.pending,
      ),
    ];
  }

  @override
  Future<List<OrderEntity>> getOrdersByRestaurantId(String restaurantId) async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      OrderModel(
        id: 'order_1',
        customerId: 'customer_123',
        restaurantId: restaurantId,
        items: [],
        totalAmount: 25.99,
        orderDate: DateTime.now().subtract(Duration(days: 1)),
        status: OrderStatus.completed,
      ),
      OrderModel(
        id: 'order_2',
        customerId: 'customer_456',
        restaurantId: restaurantId,
        items: [],
        totalAmount: 35.50,
        orderDate: DateTime.now(),
        status: OrderStatus.pending,
      ),
    ];
  }

  @override
  Future<List<OrderEntity>> getOrdersByStatus(OrderStatus status) async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      OrderModel(
        id: 'order_1',
        customerId: 'customer_123',
        restaurantId: 'restaurant_1',
        items: [],
        totalAmount: 25.99,
        orderDate: DateTime.now().subtract(Duration(days: 1)),
        status: status,
      ),
      OrderModel(
        id: 'order_2',
        customerId: 'customer_456',
        restaurantId: 'restaurant_2',
        items: [],
        totalAmount: 35.50,
        orderDate: DateTime.now(),
        status: status,
      ),
    ];
  }
}
