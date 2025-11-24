import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/pre_order_model.dart';
import 'pre_order_data_source.dart';

class FirebasePreOrderDataSource implements PreOrderDataSource {
  final FirebaseFirestore firestore;

  FirebasePreOrderDataSource(this.firestore);

  @override
  Future<PreOrderModel> createPreOrder(PreOrderModel preOrder) async {
    await firestore.collection('pre_orders').doc(preOrder.id).set(preOrder.toJson());
    return preOrder;
  }

  @override
  Future<PreOrderModel> updatePreOrder(PreOrderModel preOrder) async {
    await firestore.collection('pre_orders').doc(preOrder.id).update(preOrder.toJson());
    return preOrder;
  }

  @override
  Future<void> deletePreOrder(String id) async {
    await firestore.collection('pre_orders').doc(id).delete();
  }

  @override
  Future<PreOrderModel> getPreOrderById(String id) async {
    final doc = await firestore.collection('pre_orders').doc(id).get();
    if (!doc.exists) throw Exception('Pre-order not found');
    return PreOrderModel.fromJson(doc.data()!);
  }

  @override
  Future<List<PreOrderModel>> getPreOrdersByCustomerId(String customerId) async {
    final query = await firestore.collection('pre_orders').where('customerId', isEqualTo: customerId).get();
    return query.docs.map((doc) => PreOrderModel.fromJson(doc.data())).toList();
  }

  @override
  Future<List<PreOrderModel>> getPreOrdersByRestaurantId(String restaurantId) async {
    final query = await firestore.collection('pre_orders').where('restaurantId', isEqualTo: restaurantId).get();
    return query.docs.map((doc) => PreOrderModel.fromJson(doc.data())).toList();
  }

  @override
  Future<List<PreOrderModel>> getPreOrdersByDateRange({
    required String restaurantId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final query = await firestore
        .collection('pre_orders')
        .where('restaurantId', isEqualTo: restaurantId)
        .where('pickupTime', isGreaterThanOrEqualTo: startDate.toIso8601String())
        .where('pickupTime', isLessThanOrEqualTo: endDate.toIso8601String())
        .get();
    return query.docs.map((doc) => PreOrderModel.fromJson(doc.data())).toList();
  }
}