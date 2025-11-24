import 'package:dartz/dartz.dart';
import '../entities/order_entity.dart' as order_entity;
import '../failures/order_failure.dart';
import '../repositories/order_repository.dart';

class GetOrdersByStatus {
  final OrderRepository repository;

  GetOrdersByStatus(this.repository);

  Future<Either<OrderFailure, List<order_entity.OrderEntity>>> call(order_entity.OrderStatus status) async {
    return repository.getOrdersByStatus(status);
  }
}