import 'package:dartz/dartz.dart';
import '../entities/reservation_entity.dart';
import '../failures/reservation_failure.dart';
import '../repositories/reservation_repository.dart';

class CreateReservation {
  final ReservationRepository repository;

  CreateReservation(this.repository);

  Future<Either<ReservationFailure, Reservation>> call({
    required String customerId,
    required String restaurantId,
    required DateTime dateTime,
    required int partySize,
    String? specialRequests,
  }) async {
    if (dateTime.isBefore(DateTime.now())) {
      return Left(ReservationFailure.invalidDate());
    }

    if (partySize <= 0) {
      return Left(ReservationFailure.invalidPartySize());
    }

    final reservation = Reservation(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      customerId: customerId,
      restaurantId: restaurantId,
      dateTime: dateTime,
      partySize: partySize,
      status: ReservationStatus.pending,
      specialRequests: specialRequests,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return repository.createReservation(reservation);
  }
}