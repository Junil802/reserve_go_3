import 'package:dartz/dartz.dart';
import '../failures/menu_failure.dart';
import '../repositories/menu_repository.dart';

class DeleteMenuItem {
  final MenuRepository repository;

  DeleteMenuItem(this.repository);

  Future<Either<MenuFailure, void>> call(String id) async {
    if (id.isEmpty) {
      return Left(MenuFailure.invalidData());
    }
    return repository.deleteMenuItem(id);
  }
}