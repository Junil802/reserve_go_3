import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reserve_go_1/features/menu/data/datasources/menu_remote_data_source.dart';
import 'package:reserve_go_1/features/menu/data/models/menu_model.dart';

/// Firebase Firestore implementation of [MenuRemoteDataSource].
class MenuRemoteDataSourceImpl implements MenuRemoteDataSource {
  final FirebaseFirestore firestore;

  MenuRemoteDataSourceImpl({required this.firestore});

  CollectionReference<Map<String, dynamic>> get _menuCollection =>
      firestore.collection('menus');

  @override
  Future<void> createMenu(MenuModel menu) async {
    await _menuCollection.doc(menu.id).set(menu.toMap());
  }

  @override
  Future<void> updateMenu(MenuModel menu) async {
    await _menuCollection.doc(menu.id).update(menu.toMap());
  }

  @override
  Future<void> deleteMenu(String id) async {
    await _menuCollection.doc(id).delete();
  }

  @override
  Future<List<MenuModel>> getAllMenus() async {
    final snapshot = await _menuCollection.get();
    return snapshot.docs
        .map((doc) => MenuModel.fromMap(doc.data()))
        .toList();
  }

  @override
  Future<MenuModel> getMenuById(String id) async {
    final doc = await _menuCollection.doc(id).get();
    if (!doc.exists) throw Exception('Menu item not found');
    return MenuModel.fromMap(doc.data()!);
  }

  @override
  Future<List<MenuModel>> getMenusByBusinessId(String businessId) async {
    final snapshot =
        await _menuCollection.where('businessId', isEqualTo: businessId).get();
    return snapshot.docs
        .map((doc) => MenuModel.fromMap(doc.data()))
        .toList();
  }
}
