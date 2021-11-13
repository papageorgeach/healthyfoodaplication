import 'package:flutter/material.dart';
import 'package:foodapplication/basket/basket_widget.dart';
import 'package:foodapplication/product/product_in_order.dart';
import 'available_shops.dart';
import '../product/available_products.dart';
import 'shop.dart';

class ShopWidget extends StatefulWidget {
  final Shop shop;

  const ShopWidget(this.shop, {Key? key}) : super(key: key);

  @override
  _ShopWidgetState createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  List<ProductInOrder>? _basket;

  void _add(ProductInOrder prod) {
    setState(() {
      _basket!.add(prod);
    });

    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shop.name),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Basket()));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Shops available:',
              style: Theme.of(context).textTheme.headline4,
            ),
            AvailableProducts(widget.shop.products),
          ],
        ),
      ),
    );
  }
}
