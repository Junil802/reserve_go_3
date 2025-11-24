
import 'menu_item_availability.dart'; // Import the availability class

class MenuItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final MenuItemAvailability availability; // Add this field
  final String? imageUrl;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;

  const MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.availability, // Add to constructor
    this.imageUrl,
    this.tags = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  // Update copyWith method to include availability
  MenuItem copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? category,
    MenuItemAvailability? availability,
    String? imageUrl,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MenuItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      availability: availability ?? this.availability,
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}