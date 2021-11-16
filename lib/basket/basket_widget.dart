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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              clean();
            },
          ),
          centerTitle: true,
          title: Text("BASKET"),
        ),
        body: ListView(children: [
          for (product in applicationState.getFirst()) ProductInBasket(product),
          const Divider(
            height: 20,
            thickness: 3,
            indent: 5,
            endIndent: 5,
            color: Colors.black38,
          ),
          if (applicationState.items_in_th_basket() > 0)
            Container(
              child: Text(
                "ORDER",
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
              ),
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
        ]));
  }
}
