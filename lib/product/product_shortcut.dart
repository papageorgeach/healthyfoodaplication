import 'package:flutter/material.dart';
import 'package:foodapplication/shop/shop_widget.dart';

import '/dish.dart';
import 'product.dart';
import 'product_widget.dart';

class ProductShortcut extends StatelessWidget {
  final Product product;
  const ProductShortcut(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // When the child is tapped, show a snackbar.
        onTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(product.name)));
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProductWidget(product)));
        },
        child: Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(15.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(children: [Text(product.name)]),
        ));
  }
}
