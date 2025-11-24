import 'package:dartz/dartz.dart';
import '../entities/menu_item_entity.dart';
import '../failures/menu_failure.dart';
import '../repositories/menu_repository.dart';

class UpdateMenuItem {
  final MenuRepository repository;

  UpdateMenuItem(this.repository);

  Future<Either<MenuFailure, MenuItem>> call(MenuItem menuItem) async {
    if (menuItem.name.isEmpty || menuItem.price < 0) {
      return Left(MenuFailure.invalidData());
    }
    final updatedMenuItem = menuItem.copyWith(updatedAt: DateTime.now());
    return repository.updateMenuItem(updatedMenuItem);
  }
}