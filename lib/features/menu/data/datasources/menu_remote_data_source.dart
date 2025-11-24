import 'package:reserve_go_1/features/menu/data/models/menu_model.dart';

/// Abstract data source that defines methods for accessing remote menu data.
/// The implementation will use Firebase Firestore.
abstract class MenuRemoteDataSource {
  Future<void> createMenu(MenuModel menu);
  Future<void> updateMenu(MenuModel menu);
  Future<void> deleteMenu(String id);
  Future<List<MenuModel>> getAllMenus();
  Future<MenuModel> getMenuById(String id);
  Future<List<MenuModel>> getMenusByBusinessId(String businessId);
}
