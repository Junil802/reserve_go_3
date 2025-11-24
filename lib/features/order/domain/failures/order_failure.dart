import 'package:equatable/equatable.dart';

class OrderFailure extends Equatable {
  final String message;

  const OrderFailure(this.message);

  // Factory constructors for common failure types
  factory OrderFailure.invalidData() {
    return const OrderFailure('Invalid order data');
  }

  factory OrderFailure.notFound() {
    return const OrderFailure('Order not found');
  }

  factory OrderFailure.insufficientPermissions() {
    return const OrderFailure('Insufficient permissions');
  }

  factory OrderFailure.unexpected() {
    return const OrderFailure('Unexpected error occurred');
  }

  @override
  List<Object> get props => [message];
}
