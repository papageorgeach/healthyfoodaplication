import 'package:flutter/material.dart';
import 'package:foodapplication/shop_widget.dart';

import '/dish.dart';
import '/product.dart';
import 'shop.dart';

class ShopShortcut extends StatelessWidget {
  final Shop shop;
  const ShopShortcut(this.shop, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // When the child is tapped, show a snackbar.
        onTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(shop.name)));
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ShopWidget(shop)));
        },
        child: Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(children: [Text(shop.name), Text(shop.address)]),
        ));
  }
}
