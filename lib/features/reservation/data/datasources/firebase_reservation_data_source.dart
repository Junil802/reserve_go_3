import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/reservation_model.dart';
import 'reservation_data_source.dart';

class FirebaseReservationDataSource implements ReservationDataSource {
  final FirebaseFirestore firestore;

  FirebaseReservationDataSource(this.firestore);

  @override
  Future<ReservationModel> createReservation(ReservationModel reservation) async {
    await firestore.collection('reservations').doc(reservation.id).set(reservation.toJson());
    return reservation;
  }

  @override
  Future<ReservationModel> updateReservation(ReservationModel reservation) async {
    await firestore.collection('reservations').doc(reservation.id).update(reservation.toJson());
    return reservation;
  }

  @override
  Future<void> deleteReservation(String id) async {
    await firestore.collection('reservations').doc(id).delete();
  }

  @override
  Future<ReservationModel> getReservationById(String id) async {
    final doc = await firestore.collection('reservations').doc(id).get();
    if (!doc.exists) throw Exception('Reservation not found');
    return ReservationModel.fromJson(doc.data()!);
  }

  @override
  Future<List<ReservationModel>> getReservationsByCustomerId(String customerId) async {
    final query = await firestore.collection('reservations').where('customerId', isEqualTo: customerId).get();
    return query.docs.map((doc) => ReservationModel.fromJson(doc.data())).toList();
  }

  @override
  Future<List<ReservationModel>> getReservationsByRestaurantId(String restaurantId) async {
    final query = await firestore.collection('reservations').where('restaurantId', isEqualTo: restaurantId).get();
    return query.docs.map((doc) => ReservationModel.fromJson(doc.data())).toList();
  }

  @override
  Future<List<ReservationModel>> getReservationsByDateRange({
    required String restaurantId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final query = await firestore
        .collection('reservations')
        .where('restaurantId', isEqualTo: restaurantId)
        .where('dateTime', isGreaterThanOrEqualTo: startDate.toIso8601String())
        .where('dateTime', isLessThanOrEqualTo: endDate.toIso8601String())
        .get();
    return query.docs.map((doc) => ReservationModel.fromJson(doc.data())).toList();
  }
}