import 'package:flutter/material.dart';
import 'package:foodapplication/basket/basket.dart';
import 'package:foodapplication/product/product_in_order.dart';
import 'package:provider/provider.dart';
import 'product.dart';
import 'product_shortcut.dart';

class OrdersProducts extends StatelessWidget {
  late List<ProductInOrder> availableProducts;

  OrdersProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var applicationstate = Provider.of<CartModel>(context);
    availableProducts = applicationstate.items;
    var product;
    return Scaffold(
        body: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Products in order:",
        style: TextStyle(fontSize: 25),
      ),
      for (product in availableProducts) ProductShortcut(product.product),
    ])));
  }
}
