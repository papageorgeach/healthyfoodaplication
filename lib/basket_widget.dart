import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapplication/home.dart';
import 'package:foodapplication/product_in_basket.dart';
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

    return Scaffold(
        appBar: AppBar(
          title: Text("widget.product.name"),
        ),
        body: ProductInBasket(applicationState.getFirst()));
  }
}
