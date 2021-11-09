import 'package:flutter/material.dart';
import 'available_shops.dart';
import '../product/available_products.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Shops available:',
              style: Theme.of(context).textTheme.headline4,
            ),
            AvailableProducts(shop.products),
          ],
        ),
      ),
    );
  }
}
