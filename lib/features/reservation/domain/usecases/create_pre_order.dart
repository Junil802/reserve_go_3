import 'package:dartz/dartz.dart';
import '../entities/pre_order_entity.dart';
import '../failures/reservation_failure.dart';
import '../repositories/pre_order_repository.dart';

class CreatePreOrder {
  final PreOrderRepository repository;

  CreatePreOrder(this.repository);

  Future<Either<PreOrderFailure, PreOrder>> call({
    required String customerId,
    required String restaurantId,
    required List<PreOrderItem> items,
    required DateTime pickupTime,
    String? specialInstructions,
  }) async {
    if (pickupTime.isBefore(DateTime.now())) {
      return Left(PreOrderFailure.invalidPickupTime());
    }

    if (items.isEmpty) {
      return Left(PreOrderFailure.emptyOrder());
    }

    final preOrder = PreOrder(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      customerId: customerId,
      restaurantId: restaurantId,
      items: items,
      pickupTime: pickupTime,
      status: PreOrderStatus.pending,
      specialInstructions: specialInstructions,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return repository.createPreOrder(preOrder);
  }
}