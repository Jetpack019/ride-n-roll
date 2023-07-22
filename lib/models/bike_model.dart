import 'dart:convert';

List<BikeProduct> bikesFromJson(String str) => List<BikeProduct>.from(
    json.decode(str).map((x) => BikeProduct.fromJson(x)));

class BikeProduct {
  BikeProduct({
    required this.id,
    required this.name,
    required this.category,
    required this.product,
    required this.imageUrl,
    required this.oldPrice,
    required this.sizes,
    required this.price,
    required this.description,
    required this.title,
  });

  final String id;
  final String name;
  final String category;
  final String product;
  final List<String> imageUrl;
  final String oldPrice;
  final List<dynamic> sizes;
  final String price;
  final String description;
  final String title;

  factory BikeProduct.fromJson(Map<String, dynamic> json) => BikeProduct(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        product: json["product"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        oldPrice: json["oldPrice"],
        sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
        price: json["price"],
        description: json["description"],
        title: json["title"],
      );
}
