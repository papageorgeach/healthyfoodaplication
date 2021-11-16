import 'package:flutter/material.dart';
import 'package:foodapplication/user/profile.dart';
import 'basket/basket_widget.dart';
import 'product/product.dart';
import 'shop/shop_shortcut.dart';
import 'shop/shop.dart';
import 'shop/available_shops.dart';
import 'user/user.dart';

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
    User user = User("Achilles");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.face_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profile(user)));
            },
          )
        ],
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
