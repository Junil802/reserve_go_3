// features/order/domain/repositories/order_repository.dart

import 'package:dartz/dartz.dart';
import '../entities/order_entity.dart';
import '../failures/order_failure.dart';

abstract class OrderRepository {
  Future<Either<OrderFailure, OrderEntity>> createOrder(OrderEntity order);
  Future<Either<OrderFailure, OrderEntity>> updateOrder(OrderEntity order);
  Future<Either<OrderFailure, OrderEntity>> getOrderById(String id);
  Future<Either<OrderFailure, List<OrderEntity>>> getOrdersByCustomerId(String customerId);
  Future<Either<OrderFailure, List<OrderEntity>>> getOrdersByRestaurantId(String restaurantId);
  Future<Either<OrderFailure, List<OrderEntity>>> getOrdersByStatus(OrderStatus status);
}
