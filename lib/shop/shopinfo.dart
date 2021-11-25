import 'package:flutter/material.dart';
import 'package:foodapplication/basket/basket.dart';

import 'package:foodapplication/shop/shop.dart';
import 'package:foodapplication/shop/shop_widget.dart';
import 'package:provider/provider.dart';

class ShopInfo extends StatelessWidget {
  const ShopInfo(this.shop, {Key? key}) : super(key: key);
  final Shop shop;

  @override
  Widget build(BuildContext context) {
    var applicationState = Provider.of<CartModel>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ShopWidget(applicationState.shop))),
          ),
          centerTitle: true,
          title: Text(shop.name),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shop.name,
                  style: const TextStyle(fontSize: 35),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shop.description,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            )
          ],
        ));
  }
}
