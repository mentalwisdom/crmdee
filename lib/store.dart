import 'package:flutter/material.dart';

import 'model/product.dart';

class Store extends ChangeNotifier {
  //token
  String _token = "";
  String get token => _token;
  void setToken(token) {
    _token = token;
  }

  //product
  List<Product> _products = [];
  List<Product> get products => _products;
  void setProducts(products) {
    _products = products;
    notifyListeners();
  }

  //active product
  late Product _activeProduct;
  Product get activeProduct => _activeProduct;
  void setActiveProduct(Product activeProduct) {
    _activeProduct = activeProduct;
  }

  //cart
  List<Product> _carts = [];
  List<Product> get carts => _carts;

  void clearCart() {
    _carts = [];
    notifyListeners();
  } //ef

  double totalInCart() {
    double total = 0;
    for (int i = 0; i < _carts.length; i++) {
      total += _carts[i].qty;
    }
    return total;
  }

  void addProductToCart(Product product, int qty) {
    if (product.qty == 0) {
      product.qty += qty;
      _carts.add(product);
    } else {
      product.qty += qty;
    }

    notifyListeners();
  } //ef

  void incProductInCart(Product product) {
    product.qty++;
    if (product.qty == 1) {
      _carts.add(product);
    }
    notifyListeners();
  } //ef

  void decProductInCart(Product product) {
    product.qty--;
    if (product.qty == 0) {
      _carts.removeWhere((p) => p.productId == product.productId);
    }

    notifyListeners();
  } //ef

  void clearProductFromCart(Product product) {
    product.qty = 0;
    _carts.removeWhere((p) => p.productId == product.productId);
    notifyListeners();
  } //ef

  //dark mode
  bool _darkMode = true;
  bool get darkMode => _darkMode;
  void toggleDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners();
    print("toggle dark $_darkMode");
  }

  //showAverage
  bool _showAverage = false;
  bool get showAverage => _showAverage;
  void toggleShowAverage() {
    _showAverage = !_showAverage;
    notifyListeners();
  }

  //pad data

}//ef