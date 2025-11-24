import '../../../user/domain/failures/failure.dart';

class ReservationFailure extends Failure {
  const ReservationFailure([String? message]) : super(message);

  factory ReservationFailure.invalidDate() {
    return const ReservationFailure('Invalid reservation date');
  }

  factory ReservationFailure.invalidPartySize() {
    return const ReservationFailure('Invalid party size');
  }

  factory ReservationFailure.notFound() {
    return const ReservationFailure('Reservation not found');
  }

  factory ReservationFailure.serverError() {
    return const ReservationFailure('Server error occurred');
  }

  factory ReservationFailure.unavailableSlot() {
    return const ReservationFailure('Selected time slot is not available');
  }
}

class PreOrderFailure extends Failure {
  const PreOrderFailure([String? message]) : super(message);

  factory PreOrderFailure.invalidPickupTime() {
    return const PreOrderFailure('Invalid pickup time');
  }

  factory PreOrderFailure.emptyOrder() {
    return const PreOrderFailure('Order must contain at least one item');
  }

  factory PreOrderFailure.notFound() {
    return const PreOrderFailure('Pre-order not found');
  }

  factory PreOrderFailure.serverError() {
    return const PreOrderFailure('Server error occurred');
  }

  factory PreOrderFailure.itemNotAvailable() {
    return const PreOrderFailure('One or more items are not available');
  }
}