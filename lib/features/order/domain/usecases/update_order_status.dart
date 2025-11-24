import 'package:dartz/dartz.dart';
import 'package:reserve_go_1/features/order/domain/entities/order_entity.dart' as order_entity;
import '../repositories/order_repository.dart';
import '../failures/order_failure.dart';

class UpdateOrderStatus {
  final OrderRepository repository;

  UpdateOrderStatus(this.repository);

  Future<Either<OrderFailure, order_entity.OrderEntity>> call({
    required order_entity.OrderEntity order,
    required order_entity.OrderStatus newStatus,
  }) async {
    final updatedOrder = order.copyWith(status: newStatus);
    return await repository.updateOrder(updatedOrder);
  }
}
