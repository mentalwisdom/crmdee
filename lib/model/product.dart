import 'dart:convert';

class Product {
  final int productId;
  final String name;
  int qty;
  final double price;
  final String image;
  Product({
    required this.productId,
    required this.name,
    required this.qty,
    required this.price,
    required this.image,
  });

  Product copyWith({
    int? productId,
    String? name,
    int? qty,
    double? price,
    String? image,
  }) {
    return Product(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      qty: qty ?? this.qty,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'qty': qty,
      'price': price,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId']?.toInt(),
      name: map['name'],
      qty: map['qty']?.toInt(),
      price: map['price']?.toDouble(),
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(productId: $productId, name: $name, qty: $qty, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.productId == productId &&
      other.name == name &&
      other.qty == qty &&
      other.price == price &&
      other.image == image;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
      name.hashCode ^
      qty.hashCode ^
      price.hashCode ^
      image.hashCode;
  }
}