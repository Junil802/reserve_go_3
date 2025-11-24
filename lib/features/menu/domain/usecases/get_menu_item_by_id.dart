import 'package:dartz/dartz.dart';
import '../entities/menu_item_entity.dart';
import '../failures/menu_failure.dart';
import '../repositories/menu_repository.dart';

class GetMenuItemById {
  final MenuRepository repository;

  GetMenuItemById(this.repository);

  Future<Either<MenuFailure, MenuItem>> call(String id) async {
    if (id.isEmpty) {
      return Left(MenuFailure.invalidData());
    }
    return repository.getMenuItemById(id);
  }
}