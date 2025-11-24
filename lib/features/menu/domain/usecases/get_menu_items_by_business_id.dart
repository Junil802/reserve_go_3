import 'package:dartz/dartz.dart';
import '../entities/menu_item_entity.dart';
import '../failures/menu_failure.dart';
import '../repositories/menu_repository.dart';

class GetMenuItemsByBusinessId {
  final MenuRepository repository;

  GetMenuItemsByBusinessId(this.repository);

  Future<Either<MenuFailure, List<MenuItem>>> call(String businessId) async {
    if (businessId.isEmpty) {
      return Left(MenuFailure.invalidData());
    }
    return repository.getMenuItemsByBusinessId(businessId);
  }
}