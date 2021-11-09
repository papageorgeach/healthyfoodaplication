import 'package:flutter/material.dart';
import '/product.dart';
import 'shop_shortcut.dart';
import '/shop.dart';
import 'available_shops.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Shop? shop;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Product chicken = Product("chicken", "description", 2, 150, 30, 2, 5);
    Product egg = Product("egg", "description", 2, 150, 30, 2, 5);
    Product potato = Product("potato", "description", 2, 150, 30, 2, 5);
    List<Product> products = [chicken, egg, potato];

    Shop shop1 = Shop("shop1", "address", "phone", products);
    Shop shop2 = Shop("shop2", "address", "phone", products);
    Shop shop3 = Shop("shop3", "address", "phone", products);

    List<Shop> shops = [shop1, shop2, shop3];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Shops available:',
              style: Theme.of(context).textTheme.headline4,
            ),
            AvailableShops(shops),
          ],
        ),
      ),
    );
  }
}
