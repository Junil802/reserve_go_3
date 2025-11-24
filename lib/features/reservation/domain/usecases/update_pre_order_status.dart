import 'package:dartz/dartz.dart';
import '../entities/pre_order_entity.dart';
import '../failures/reservation_failure.dart';
import '../repositories/pre_order_repository.dart';

class UpdatePreOrderStatus {
  final PreOrderRepository repository;

  UpdatePreOrderStatus(this.repository);

  Future<Either<PreOrderFailure, PreOrder>> call({
    required String preOrderId,
    required PreOrderStatus newStatus,
  }) async {
    final preOrderResult = await repository.getPreOrderById(preOrderId);

    return preOrderResult.fold(
      (failure) => Left(failure),
      (preOrder) {
        final updatedPreOrder = preOrder.copyWith(
          status: newStatus,
          updatedAt: DateTime.now(),
        );
        return repository.updatePreOrder(updatedPreOrder);
      },
    );
  }
}