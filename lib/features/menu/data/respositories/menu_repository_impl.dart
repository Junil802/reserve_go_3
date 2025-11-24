import 'package:dartz/dartz.dart';
import 'package:reserve_go_1/features/menu/domain/entities/menu_item_entity.dart';
import 'package:reserve_go_1/features/menu/domain/failures/menu_failure.dart';
import 'package:reserve_go_1/features/menu/domain/repositories/menu_repository.dart';
import 'package:reserve_go_1/features/menu/data/datasources/menu_remote_data_source.dart';
import 'package:reserve_go_1/features/menu/data/models/menu_model.dart';

class MenuRepositoryImpl implements MenuRepository {
  final MenuRemoteDataSource remoteDataSource;

  MenuRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<MenuFailure, MenuItem>> createMenuItem(MenuItem menuItem) async {
    try {
      final model = MenuModel(
        id: menuItem.id,
        name: menuItem.name,
        description: menuItem.description,
        price: menuItem.price,
        category: menuItem.category,
        availability: menuItem.availability,
        imageUrl: menuItem.imageUrl,
        tags: menuItem.tags,
        createdAt: menuItem.createdAt,
        updatedAt: menuItem.updatedAt,
      );

      await remoteDataSource.createMenu(model);
      return Right(menuItem);
    } catch (e) {
      return Left(MenuFailure('Failed to create menu item: $e'));
    }
  }

  @override
  Future<Either<MenuFailure, void>> deleteMenuItem(String id) async {
    try {
      await remoteDataSource.deleteMenu(id);
      return const Right(null);
    } catch (e) {
      return Left(MenuFailure('Failed to delete menu item: $e'));
    }
  }

  @override
  Future<Either<MenuFailure, List<MenuItem>>> getAllMenuItems() async {
    try {
      final models = await remoteDataSource.getAllMenus();
      final items = models.map((model) => model.toEntity()).toList();
      return Right(items);
    } catch (e) {
      return Left(MenuFailure('Failed to load all menu items: $e'));
    }
  }

  @override
  Future<Either<MenuFailure, MenuItem>> getMenuItemById(String id) async {
    try {
      final model = await remoteDataSource.getMenuById(id);
      return Right(model.toEntity());
    } catch (e) {
      return Left(MenuFailure('Failed to get menu item by ID: $e'));
    }
  }

  @override
  Future<Either<MenuFailure, List<MenuItem>>> getMenuItemsByBusinessId(String businessId) async {
    try {
      final models = await remoteDataSource.getMenusByBusinessId(businessId);
      final items = models.map((model) => model.toEntity()).toList();
      return Right(items);
    } catch (e) {
      return Left(MenuFailure('Failed to get menus for business: $e'));
    }
  }

  @override
  Future<Either<MenuFailure, MenuItem>> updateMenuItem(MenuItem menuItem) async {
    try {
      final menuModel = MenuModel.fromEntity(menuItem);
      await remoteDataSource.updateMenu(menuModel);
      return Right(menuItem);
    } catch (e) {
      return Left(MenuFailure(e.toString()));
    }
  }
}
