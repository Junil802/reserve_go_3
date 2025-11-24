import 'package:dartz/dartz.dart';
import '../entities/pre_order_entity.dart';
import '../failures/reservation_failure.dart';
import '../repositories/pre_order_repository.dart';

class GetPreOrders {
  final PreOrderRepository repository;

  GetPreOrders(this.repository);

  Future<Either<PreOrderFailure, List<PreOrder>>> getByDateRange({
    required String restaurantId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    if (startDate.isAfter(endDate)) {
      return Left(PreOrderFailure.invalidPickupTime());
    }

    return repository.getPreOrdersByDateRange(
      restaurantId: restaurantId,
      startDate: startDate,
      endDate: endDate,
    );
  }

  Future<Either<PreOrderFailure, List<PreOrder>>> getByCustomerId(String customerId) {
    return repository.getPreOrdersByCustomerId(customerId);
  }

  Future<Either<PreOrderFailure, List<PreOrder>>> getByRestaurantId(String restaurantId) {
    return repository.getPreOrdersByRestaurantId(restaurantId);
  }
}