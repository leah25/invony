class Product {
  final String imageUrl;
  final String name;
  final String category;
  final String price;
  final String description;
  // final int quantity;
  final int id;

  Product({
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.description,
    required this.id,
    required this.name,
    // required this.quantity
  });
}
