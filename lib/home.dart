import 'package:flutter/material.dart';
import 'package:foodapplication/address/address_widget.dart';
import 'package:foodapplication/basket/basket.dart';
import 'package:foodapplication/user/profile.dart';
import 'package:provider/provider.dart';
import 'address/address.dart';

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
  Shop? shop;

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Warning'),
            content: const Text('Do you want to change address ?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Address_widget())),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    var applicationstate = Provider.of<CartModel>(context);
    Product chicken =
        Product("chicken", "description", 2, true, false, 150, 30, 2, 5);
    Product egg = Product("egg", "description", 2, false, true, 150, 30, 2, 5);
    Product potato =
        Product("potato", "description", 2, true, false, 150, 30, 2, 5);
    List<Product> products = [chicken, egg, potato];

    Shop shop1 = Shop("shop1", "address", "phone",
        "description description description", products);
    Shop shop2 = Shop("shop2", "address", "phone",
        "description description description", products);
    Shop shop3 = Shop("shop3", "address", "phone",
        "description description description", products);

    List<Shop> shops = [shop1, shop2, shop3];
    User user = User("Achilles");

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Profile(user)));
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Shops available for:',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                applicationstate.address,
                style: Theme.of(context).textTheme.headline6,
              ),
              AvailableShops(shops),
            ],
          ),
        ),
      ),
    );
  }
}
