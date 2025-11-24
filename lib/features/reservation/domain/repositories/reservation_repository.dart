import 'package:dartz/dartz.dart';
import '../entities/reservation_entity.dart';
import '../failures/reservation_failure.dart';

abstract class ReservationRepository {
  Future<Either<ReservationFailure, Reservation>> createReservation(Reservation reservation);
  Future<Either<ReservationFailure, Reservation>> updateReservation(Reservation reservation);
  Future<Either<ReservationFailure, Reservation>> getReservationById(String id);
  Future<Either<ReservationFailure, List<Reservation>>> getReservationsByCustomerId(String customerId);
  Future<Either<ReservationFailure, List<Reservation>>> getReservationsByRestaurantId(String restaurantId);
  Future<Either<ReservationFailure, List<Reservation>>> getReservationsByDateRange({
    required String restaurantId,
    required DateTime startDate,
    required DateTime endDate,
  });
  Future<Either<ReservationFailure, void>> deleteReservation(String id);
}