import '../models/reservation_model.dart';

abstract class ReservationDataSource {
  Future<ReservationModel> createReservation(ReservationModel reservation);
  Future<ReservationModel> updateReservation(ReservationModel reservation);
  Future<void> deleteReservation(String id);
  Future<ReservationModel> getReservationById(String id);
  Future<List<ReservationModel>> getReservationsByCustomerId(String customerId);
  Future<List<ReservationModel>> getReservationsByRestaurantId(String restaurantId);
  Future<List<ReservationModel>> getReservationsByDateRange({
    required String restaurantId,
    required DateTime startDate,
    required DateTime endDate,
  });
}