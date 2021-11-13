import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapplication/home.dart';
import 'package:foodapplication/basket/product_in_basket.dart';
import 'package:foodapplication/shop/shop_widget.dart';
import 'package:provider/provider.dart';
import 'basket.dart';

class Basket extends StatelessWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var applicationState = Provider.of<CartModel>(context);
    void clean() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ShopWidget(applicationState.shop)));
    }

    var product;
    return Scaffold(
        appBar: AppBar(
          title: Text("BASKET"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          for (product in applicationState.getFirst())
            Container(
              child: ProductInBasket(product),
            ),
        ]));
  }
}
