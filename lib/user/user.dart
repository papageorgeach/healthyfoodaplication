import 'package:flutter/material.dart';
import 'package:foodapplication/product/product_in_order.dart';
import 'package:foodapplication/shop/shop.dart';

class User extends ChangeNotifier {
  /// Internal, private state of the cart.
  User(this.name);
  String name;

  void login(String name) {
    name = name;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
