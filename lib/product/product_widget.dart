import 'package:flutter/cupertino.dart';
import 'package:foodapplication/product/product_in_order.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:foodapplication/shop/shop_widget.dart';
import '../basket/basket.dart';
import '../basket/basket_widget.dart';
import '../order_widget.dart';
import 'product.dart';

class ProductWidget extends StatefulWidget {
  final Product product;

  const ProductWidget(this.product, {Key? key}) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  int _quantity = 0;

  void _add() {
    setState(() {
      _quantity++;
    });

    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }

  void _remove() {
    setState(() {
      _quantity--;
    });

    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }

  void addToList() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => OrderWidget(_quantity)));
  }

  @override
  Widget build(BuildContext context) {
    var applicationState = Provider.of<CartModel>(context);

    void addstate() {
      if (_quantity == 0) {
        return;
      } else {
        ProductInOrder item = ProductInOrder(widget.product, _quantity, 25);
        //applicationState.removeAll();
        applicationState.add(item);

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${item.product.name} added')));

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ShopWidget(applicationState.shop)));
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Basket())),
        ),
        centerTitle: true,
        title: Text(widget.product.name),
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
      body: Column(children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.name,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 40),
              )
            ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(onPressed: _remove, icon: Icon(Icons.remove)),
            Text(
              '$_quantity',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 40),
            ),
            IconButton(onPressed: _add, icon: Icon(Icons.add)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(onPressed: addstate, child: Icon(Icons.add))
          ],
        )
      ]),
    );
  }
}
