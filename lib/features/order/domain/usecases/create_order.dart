import 'package:dartz/dartz.dart';
import 'package:reserve_go_1/features/order/domain/entities/order_entity.dart' as order_entity;
import '../repositories/order_repository.dart';
import '../failures/order_failure.dart';

class CreateOrder {
  final OrderRepository repository;

  CreateOrder(this.repository);

  Future<Either<OrderFailure, order_entity.OrderEntity>> call({
    required String id,
    required String customerId,
    required String restaurantId,
    required order_entity.OrderStatus status,
  }) async {
    final order = order_entity.OrderEntity(
      id: id,
      customerId: customerId,
      restaurantId: restaurantId,
      status: status,
      items: [],
      totalAmount: 0.0,
      orderDate: DateTime.now(),
    );

    return await repository.createOrder(order);
  }
}
