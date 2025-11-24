import 'package:dartz/dartz.dart';
import '../entities/reservation_entity.dart';
import '../failures/reservation_failure.dart';
import '../repositories/reservation_repository.dart';

class UpdateReservationStatus {
  final ReservationRepository repository;

  UpdateReservationStatus(this.repository);

  Future<Either<ReservationFailure, Reservation>> call({
    required String reservationId,
    required ReservationStatus newStatus,
  }) async {
    final reservationResult = await repository.getReservationById(reservationId);

    return reservationResult.fold(
      (failure) => Left(failure),
      (reservation) {
        final updatedReservation = reservation.copyWith(
          status: newStatus,
          updatedAt: DateTime.now(),
        );
        return repository.updateReservation(updatedReservation);
      },
    );
  }
}