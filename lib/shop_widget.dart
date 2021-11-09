import 'package:flutter/material.dart';
import 'available_shops.dart';
import 'shop.dart';

class ShopWidget extends StatelessWidget {
  Shop shop;
  ShopWidget(this.shop, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
      ),
    );
  }
}
