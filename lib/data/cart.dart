import 'package:dro_test/model/cartModel.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<CartModel> cartList = [];
  int totalAmount = 0;

  addToCart(CartModel model) {
    cartList.add(model);
    updateTotalAmount();
  }

  removeFromCart(int index) {
    cartList.removeAt(index);
    updateTotalAmount();
  }

  updateTotalAmount() {
    int temp = 0;
    for (CartModel cart in cartList) {
      temp += cart.amount;
    }
    totalAmount = temp;
    notifyListeners();
  }

  changeInPrice(int qty, int index) {
    cartList[index].amount = (qty * cartList[index].eachAmount);
    updateTotalAmount();
  }
}
