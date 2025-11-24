import 'package:dartz/dartz.dart';
import '../entities/order_entity.dart' as order_entity;
import '../failures/order_failure.dart';
import '../repositories/order_repository.dart';

class GetOrderById {
  final OrderRepository repository;

  GetOrderById(this.repository);

  Future<Either<OrderFailure, order_entity.OrderEntity>> call(String id) async {
    return await repository.getOrderById(id);
  }
}
