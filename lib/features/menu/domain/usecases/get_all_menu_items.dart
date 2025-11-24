import 'package:dartz/dartz.dart';
import '../entities/menu_item_entity.dart';
import '../failures/menu_failure.dart';
import '../repositories/menu_repository.dart';

class GetAllMenuItems {
  final MenuRepository repository;

  GetAllMenuItems(this.repository);

  Future<Either<MenuFailure, List<MenuItem>>> call() async {
    return repository.getAllMenuItems();
  }
}