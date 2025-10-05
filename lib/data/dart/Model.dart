// product.dart
class Product {
  final String id;
  final String name;
  final String category;
  final String image;
  final String description;
  final String details;
  final double price;
   int quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.details,
    required this.price,
    this.quantity =1
  });

  double get totalPrice => price * quantity;
}
