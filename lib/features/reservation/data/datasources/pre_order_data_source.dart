import '../models/pre_order_model.dart';

abstract class PreOrderDataSource {
  Future<PreOrderModel> createPreOrder(PreOrderModel preOrder);
  Future<PreOrderModel> updatePreOrder(PreOrderModel preOrder);
  Future<void> deletePreOrder(String id);
  Future<PreOrderModel> getPreOrderById(String id);
  Future<List<PreOrderModel>> getPreOrdersByCustomerId(String customerId);
  Future<List<PreOrderModel>> getPreOrdersByRestaurantId(String restaurantId);
  Future<List<PreOrderModel>> getPreOrdersByDateRange({
    required String restaurantId,
    required DateTime startDate,
    required DateTime endDate,
  });
}