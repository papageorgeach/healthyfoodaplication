import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodapplication/product/product_in_order.dart';

import 'basket.dart';

class ProductInBasket extends StatelessWidget {
  final ProductInOrder prod;
  const ProductInBasket(this.prod, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var applicationState = Provider.of<CartModel>(context);
    return GestureDetector(
        // When the child is tapped, show a snackbar.
        onTap: () {
          // applicationState.removeAll();
          // applicationState.setShop(shop);

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(prod.product.name)));
          // Navigator.of(context)
          //   .push(MaterialPageRoute(builder: (context) => ShopWidget(shop)));
        },
        child: Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(children: [
            Text(prod.product.name),
            Text(prod.quantity.toString())
          ]),
        ));
  }
}
