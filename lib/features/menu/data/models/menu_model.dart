import 'package:reserve_go_1/features/menu/domain/entities/menu_item_entity.dart';
import 'package:reserve_go_1/features/menu/domain/entities/menu_item_availability.dart';

class MenuModel extends MenuItem {
  const MenuModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.category,
    required super.availability,
    super.imageUrl,
    super.tags = const [],
    required super.createdAt,
    required super.updatedAt,
  });

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    final availabilityMap = map['availability'] ?? {};

    return MenuModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      category: map['category'] ?? '',

      availability: MenuItemAvailability(
        isAvailable: availabilityMap['isAvailable'] ?? true,
        availableFrom: availabilityMap['availableFrom'] != null
            ? DateTime.parse(availabilityMap['availableFrom'])
            : null,
        availableUntil: availabilityMap['availableUntil'] != null
            ? DateTime.parse(availabilityMap['availableUntil'])
            : null,
        availableDays: List<String>.from(
          availabilityMap['availableDays'] ?? [],
        ),
      ),

      imageUrl: map['imageUrl'],
      tags: List<String>.from(map['tags'] ?? []),
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(map['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'availability': {
        'isAvailable': availability.isAvailable,
        'availableFrom': availability.availableFrom?.toIso8601String(),
        'availableUntil': availability.availableUntil?.toIso8601String(),
        'availableDays': availability.availableDays,
      },
      'imageUrl': imageUrl,
      'tags': tags,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory MenuModel.fromEntity(MenuItem item) {
    return MenuModel(
      id: item.id,
      name: item.name,
      description: item.description,
      price: item.price,
      category: item.category,
      availability: item.availability,
      imageUrl: item.imageUrl,
      tags: item.tags,
      createdAt: item.createdAt,
      updatedAt: item.updatedAt,
    );
  }

  MenuItem toEntity() {
    return MenuItem(
      id: id,
      name: name,
      description: description,
      price: price,
      category: category,
      availability: availability,
      imageUrl: imageUrl,
      tags: tags,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
