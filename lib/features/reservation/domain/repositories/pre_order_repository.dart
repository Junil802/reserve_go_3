import 'package:dartz/dartz.dart';
import '../entities/pre_order_entity.dart';
import '../failures/reservation_failure.dart';

abstract class PreOrderRepository {
  Future<Either<PreOrderFailure, PreOrder>> createPreOrder(PreOrder preOrder);
  Future<Either<PreOrderFailure, PreOrder>> updatePreOrder(PreOrder preOrder);
  Future<Either<PreOrderFailure, PreOrder>> getPreOrderById(String id);
  Future<Either<PreOrderFailure, List<PreOrder>>> getPreOrdersByCustomerId(String customerId);
  Future<Either<PreOrderFailure, List<PreOrder>>> getPreOrdersByRestaurantId(String restaurantId);
  Future<Either<PreOrderFailure, List<PreOrder>>> getPreOrdersByDateRange({
    required String restaurantId,
    required DateTime startDate,
    required DateTime endDate,
  });
  Future<Either<PreOrderFailure, void>> deletePreOrder(String id);
}