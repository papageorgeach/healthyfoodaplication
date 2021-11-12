import 'package:flutter/material.dart';
import 'product.dart';
import 'product_shortcut.dart';

class AvailableProducts extends StatelessWidget {
  List<Product> availableProducts;

  AvailableProducts(this.availableProducts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      for (product in availableProducts)
        Container(
          child: ProductShortcut(product),
        ),
    ]);
  }
}
