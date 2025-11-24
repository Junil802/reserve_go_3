import 'package:equatable/equatable.dart';

/// Base class for all types of Failures used in the app.
/// Extend this class to create specific failure types, such as
/// [ServerFailure], [CacheFailure], or [NetworkFailure].
abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => [];
}

/// Represents a failure when a server request fails (e.g., Firebase, API)
class ServerFailure extends Failure {}

/// Represents a failure when reading or writing from local cache fails
class CacheFailure extends Failure {}

/// Represents a failure when there is no internet connection
class NetworkFailure extends Failure {}

/// Example: a failure specific to menus (you can use this in your domain layer)
class MenuFailure extends Failure {
  final String message;

  const MenuFailure(this.message);

  @override
  List<Object?> get props => [message];
}
