import 'package:equatable/equatable.dart';

class Menu extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final bool isAvailable;

  const Menu({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isAvailable,
  });

  @override
  List<Object?> get props => [id, name, description, price, imageUrl, isAvailable];
}
