import 'package:dartz/dartz.dart';
import '../entities/menu_item_entity.dart';
import '../failures/menu_failure.dart';

abstract class MenuRepository {
  Future<Either<MenuFailure, MenuItem>> createMenuItem(MenuItem menuItem);
  Future<Either<MenuFailure, MenuItem>> updateMenuItem(MenuItem menuItem);
  Future<Either<MenuFailure, void>> deleteMenuItem(String id);
  Future<Either<MenuFailure, MenuItem>> getMenuItemById(String id);
  Future<Either<MenuFailure, List<MenuItem>>> getMenuItemsByBusinessId(String businessId);
  Future<Either<MenuFailure, List<MenuItem>>> getAllMenuItems();
}