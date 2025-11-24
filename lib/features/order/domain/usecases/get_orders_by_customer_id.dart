import 'package:dartz/dartz.dart';
import 'package:reserve_go_1/features/order/domain/entities/order_entity.dart' as order_entity;
import '../repositories/order_repository.dart';
import '../failures/order_failure.dart';

class GetOrdersByCustomerId {
  final OrderRepository repository;

  GetOrdersByCustomerId(this.repository);

  Future<Either<OrderFailure, List<order_entity.OrderEntity>>> call(String customerId) async {
    return await repository.getOrdersByCustomerId(customerId);
  }
}
