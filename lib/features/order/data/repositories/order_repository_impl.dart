// features/order/data/repositories/order_repository.dart
import 'package:dartz/dartz.dart';
import '../datasources/order_remote_data_source.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/failures/order_failure.dart';
import '../models/order_model.dart';

abstract class OrderRepository {
  Future<Either<OrderFailure, OrderEntity>> createOrder(OrderEntity order);
  Future<Either<OrderFailure, List<OrderEntity>>> getOrdersByRestaurantId(String restaurantId);
  // Add other methods if needed
}

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<OrderFailure, OrderEntity>> createOrder(OrderEntity order) async {
    try {
      final model = OrderModel.fromEntity(order);
      await remoteDataSource.createOrder(model);
      return Right(order);
    } catch (_) {
      return Left(OrderFailure.unexpected());
    }
  }

  @override
  Future<Either<OrderFailure, List<OrderEntity>>> getOrdersByRestaurantId(String restaurantId) async {
    try {
      final orders = await remoteDataSource.getOrdersByRestaurantId(restaurantId);
      return Right(orders);
    } catch (_) {
      return Left(OrderFailure.unexpected());
    }
  }
}
