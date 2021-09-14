import 'dart:convert';

class OrderItem {
  final int productId;
    int qty;
  final int discount;
  OrderItem({
    required this.productId,
    required this.qty,
    required this.discount,
  });

  OrderItem copyWith({
    int? productId,
    int? qty,
    int? discount,
  }) {
    return OrderItem(
      productId: productId ?? this.productId,
      qty: qty ?? this.qty,
      discount: discount ?? this.discount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'qty': qty,
      'discount': discount,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      productId: map['productId']?.toInt(),
      qty: map['qty']?.toInt(),
      discount: map['discount']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) => OrderItem.fromMap(json.decode(source));

  @override
  String toString() => 'OrderItem(productId: $productId, qty: $qty, discount: $discount)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OrderItem &&
      other.productId == productId &&
      other.qty == qty &&
      other.discount == discount;
  }

  @override
  int get hashCode => productId.hashCode ^ qty.hashCode ^ discount.hashCode;
}