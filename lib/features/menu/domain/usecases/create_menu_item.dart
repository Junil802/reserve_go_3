import 'package:dartz/dartz.dart';
import '../entities/menu_item_entity.dart';
import '../entities/menu_item_availability.dart';
import '../repositories/menu_repository.dart';
import '../failures/menu_failure.dart';

class CreateMenuItemParams {
  final String name;
  final String description;
  final double price;
  final String category;
  final MenuItemAvailability availability;
  final String? imageUrl;
  final List<String> tags;

  const CreateMenuItemParams({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.availability,
    this.imageUrl,
    this.tags = const [],
  });
}

class CreateMenuItem {
  final MenuRepository repository;

  CreateMenuItem(this.repository);

  Future<Either<MenuFailure, MenuItem>> call(CreateMenuItemParams params) async {
    // Validate parameters
    if (params.name.isEmpty) {
      return Left(MenuFailure.invalidName()); // This should work now
    }
    if (params.price <= 0) {
      return Left(MenuFailure.invalidPrice()); // This should work now
    }

    // Create menu item entity
    final menuItem = MenuItem(
      id: _generateId(),
      name: params.name,
      description: params.description,
      price: params.price,
      category: params.category,
      availability: params.availability,
      imageUrl: params.imageUrl,
      tags: params.tags,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return await repository.createMenuItem(menuItem);
  }

  String _generateId() {
    return 'menu_${DateTime.now().millisecondsSinceEpoch}';
  }
}