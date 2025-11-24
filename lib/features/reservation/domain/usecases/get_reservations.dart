import 'package:dartz/dartz.dart';
import '../entities/reservation_entity.dart';
import '../failures/reservation_failure.dart';
import '../repositories/reservation_repository.dart';

class GetReservations {
  final ReservationRepository repository;

  GetReservations(this.repository);

  Future<Either<ReservationFailure, List<Reservation>>> getByDateRange({
    required String restaurantId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    if (startDate.isAfter(endDate)) {
      return Left(ReservationFailure.invalidDate());
    }

    return repository.getReservationsByDateRange(
      restaurantId: restaurantId,
      startDate: startDate,
      endDate: endDate,
    );
  }

  Future<Either<ReservationFailure, List<Reservation>>> getByCustomerId(String customerId) {
    return repository.getReservationsByCustomerId(customerId);
  }

  Future<Either<ReservationFailure, List<Reservation>>> getByRestaurantId(String restaurantId) {
    return repository.getReservationsByRestaurantId(restaurantId);
  }
}