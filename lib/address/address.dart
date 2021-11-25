import 'package:flutter/material.dart';
import 'package:foodapplication/order.dart';
import 'package:foodapplication/product/product_in_order.dart';
import 'package:foodapplication/shop/shop.dart';

class Address extends ChangeNotifier {
  /// Internal, private state of the cart.
  Address();
  // list of older orders from this address in FUTURE
  late String address;

  void setAdress(String s) {
    address = s;
  }

  /*
  void addOrder(Order order)
  {

  }
  */
}
