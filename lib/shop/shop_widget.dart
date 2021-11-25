import 'package:flutter/material.dart';
import 'package:foodapplication/basket/basket.dart';
import 'package:foodapplication/shop/shopinfo.dart';
import 'package:provider/provider.dart';
import 'package:foodapplication/basket/basket_widget.dart';
import 'package:foodapplication/home.dart';
import 'package:foodapplication/product/product_in_order.dart';
import 'available_shops.dart';
import '../home.dart';
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
    var applicationState = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Go back to shops'),
                content:
                    const Text('Your order in this shop is goig to be deleted'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      applicationState.removeAll();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const MyHomePage(title: "E-healthyfood")));
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text(
          widget.shop.name,
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Basket()));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.info_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShopInfo(applicationState.shop)));
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Products:',
              style: Theme.of(context).textTheme.headline4,
            ),
            AvailableProducts(widget.shop.products),
          ],
        ),
      ),
    );
  }
}
