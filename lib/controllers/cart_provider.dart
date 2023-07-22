import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;

  void increment() {
    _quantity++;
    notifyListeners();
  }

  void decrement() {
    if (_quantity > 0) {
      _quantity--;
      notifyListeners();
    }
  }
}
