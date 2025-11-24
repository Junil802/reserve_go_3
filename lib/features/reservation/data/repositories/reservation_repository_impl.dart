import '../../domain/repositories/reservation_repository.dart';
import '../../domain/entities/reservation_entity.dart';
import '../models/reservation_model.dart';
import '../datasources/reservation_data_source.dart';
import '../../domain/failures/reservation_failure.dart';
import 'package:dartz/dartz.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationDataSource dataSource;

  ReservationRepositoryImpl(this.dataSource);

  @override
  Future<Either<ReservationFailure, Reservation>> createReservation(Reservation reservation) async {
    try {
      final model = ReservationModel(
        id: reservation.id,
        customerId: reservation.customerId,
        restaurantId: reservation.restaurantId,
        dateTime: reservation.dateTime,
        partySize: reservation.partySize,
        status: reservation.status,
        specialRequests: reservation.specialRequests,
        createdAt: reservation.createdAt,
        updatedAt: reservation.updatedAt,
      );
      final result = await dataSource.createReservation(model);
      return Right(result);
    } catch (e) {
      return Left(ReservationFailure.serverError());
    }
  }

  @override
  Future<Either<ReservationFailure, Reservation>> updateReservation(Reservation reservation) async {
    try {
      final model = ReservationModel(
        id: reservation.id,
        customerId: reservation.customerId,
        restaurantId: reservation.restaurantId,
        dateTime: reservation.dateTime,
        partySize: reservation.partySize,
        status: reservation.status,
        specialRequests: reservation.specialRequests,
        createdAt: reservation.createdAt,
        updatedAt: reservation.updatedAt,
      );
      final result = await dataSource.updateReservation(model);
      return Right(result);
    } catch (e) {
      return Left(ReservationFailure.serverError());
    }
  }

  @override
  Future<Either<ReservationFailure, void>> deleteReservation(String id) async {
    try {
      await dataSource.deleteReservation(id);
      return const Right(null);
    } catch (e) {
      return Left(ReservationFailure.serverError());
    }
  }

  @override
  Future<Either<ReservationFailure, Reservation>> getReservationById(String id) async {
    try {
      final result = await dataSource.getReservationById(id);
      return Right(result);
    } catch (e) {
      return Left(ReservationFailure.notFound());
    }
  }

  @override
  Future<Either<ReservationFailure, List<Reservation>>> getReservationsByCustomerId(String customerId) async {
    try {
      final result = await dataSource.getReservationsByCustomerId(customerId);
      return Right(result);
    } catch (e) {
      return Left(ReservationFailure.serverError());
    }
  }

  @override
  Future<Either<ReservationFailure, List<Reservation>>> getReservationsByRestaurantId(String restaurantId) async {
    try {
      final result = await dataSource.getReservationsByRestaurantId(restaurantId);
      return Right(result);
    } catch (e) {
      return Left(ReservationFailure.serverError());
    }
  }

  @override
  Future<Either<ReservationFailure, List<Reservation>>> getReservationsByDateRange({
    required String restaurantId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final result = await dataSource.getReservationsByDateRange(
        restaurantId: restaurantId,
        startDate: startDate,
        endDate: endDate,
      );
      return Right(result);
    } catch (e) {
      return Left(ReservationFailure.serverError());
    }
  }
}