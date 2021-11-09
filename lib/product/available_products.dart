import 'package:flutter/material.dart';
import 'product.dart';
import 'product_shortcut.dart';

class AvailableProducts extends StatelessWidget {
  List<Product> availableProducts;

  AvailableProducts(this.availableProducts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shop;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      for (shop in availableProducts)
        Container(
          child: ProductShortcut(shop),
        ),
    ]);
  }
}
