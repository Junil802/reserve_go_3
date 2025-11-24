class MenuItemAvailability {
  final bool isAvailable;
  final DateTime? availableFrom;
  final DateTime? availableUntil;
  final List<String> availableDays; // ['monday', 'tuesday', etc.]

  const MenuItemAvailability({
    required this.isAvailable,
    this.availableFrom,
    this.availableUntil,
    this.availableDays = const [],
  });

  // Add copyWith method for immutability
  MenuItemAvailability copyWith({
    bool? isAvailable,
    DateTime? availableFrom,
    DateTime? availableUntil,
    List<String>? availableDays,
  }) {
    return MenuItemAvailability(
      isAvailable: isAvailable ?? this.isAvailable,
      availableFrom: availableFrom ?? this.availableFrom,
      availableUntil: availableUntil ?? this.availableUntil,
      availableDays: availableDays ?? this.availableDays,
    );
  }
}