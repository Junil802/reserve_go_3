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
  final FirebaseFirestore firestore;

  OrderRemoteDataSourceImpl({required this.firestore});

  @override
  Future<OrderModel> createOrder(OrderModel order) async {
    await firestore.collection('orders').doc(order.id).set(order.toDocument());
    return order;
  }

  @override
  Future<OrderModel> updateOrder(OrderModel order) async {
    await firestore.collection('orders').doc(order.id).update(order.toDocument());
    return order;
  }

  @override
  Future<OrderModel> getOrderById(String id) async {
    final doc = await firestore.collection('orders').doc(id).get();
    return OrderModel.fromDocumentSnapshot(doc);
  }

  @override
  Future<List<OrderEntity>> getOrdersByCustomerId(String customerId) async {
    final query = await firestore
        .collection('orders')
        .where('customerId', isEqualTo: customerId)
        .get();

    return query.docs.map((doc) => OrderModel.fromDocumentSnapshot(doc)).toList();
  }

  @override
  Future<List<OrderEntity>> getOrdersByRestaurantId(String restaurantId) async {
    final query = await firestore
        .collection('orders')
        .where('restaurantId', isEqualTo: restaurantId)
        .get();

    return query.docs.map((doc) => OrderModel.fromDocumentSnapshot(doc)).toList();
  }

  @override
  Future<List<OrderEntity>> getOrdersByStatus(OrderStatus status) async {
    final query = await firestore
        .collection('orders')
        .where('status', isEqualTo: status.name)
        .get();

    return query.docs.map((doc) => OrderModel.fromDocumentSnapshot(doc)).toList();
  }
}
