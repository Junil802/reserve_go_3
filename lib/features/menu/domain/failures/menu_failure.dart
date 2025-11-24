
import 'package:equatable/equatable.dart';

class MenuFailure extends Equatable {
  final String message;

  const MenuFailure(this.message);

  // Factory constructors - these are the correct way
  factory MenuFailure.invalidName() {
    return const MenuFailure('Invalid menu item name');
  }

  factory MenuFailure.invalidPrice() {
    return const MenuFailure('Price must be greater than 0');
  }

  factory MenuFailure.insufficientPermissions() {
    return const MenuFailure('Insufficient permissions');
  }

  factory MenuFailure.notFound() {
    return const MenuFailure('Menu item not found');
  }

   factory MenuFailure.invalidData() {
    return const MenuFailure('Invalid menu item data');
  }

  factory MenuFailure.unexpected() {
    return const MenuFailure('Unexpected error occurred');
  }

  @override
  List<Object> get props => [message];
}