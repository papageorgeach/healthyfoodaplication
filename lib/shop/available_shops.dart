import 'package:flutter/material.dart';
import 'shop.dart';
import 'shop_shortcut.dart';

class AvailableShops extends StatelessWidget {
  List<Shop> availableshops;

  AvailableShops(this.availableshops, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shop;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      for (shop in availableshops)
        Container(
          child: ShopShortcut(shop),
        ),
    ]);
  }
}
