import 'package:dro_test/model/cartModel.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<CartModel> cartList = [];
  int totalAmount = 0;

  addToCart(CartModel model) {
    cartList.add(model);
    notifyListeners();
  }

  removeFromCart(int index) {
    cartList.removeAt(index);
    notifyListeners();
  }
}
