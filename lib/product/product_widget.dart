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
  late int _quantity;

  ProductWidget(this.product, {Key? key}) {
    if (product.per100)
      _quantity = 100;
    else
      _quantity = 1;
  }

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  void _add() {
    setState(() {
      if (widget.product.per100) {
        widget._quantity = widget._quantity + 100;
      } else {
        widget._quantity = widget._quantity + 1;
      }
    });

    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }

  void _remove() {
    setState(() {
      if (widget.product.per100) {
        if (widget._quantity > 100) widget._quantity = widget._quantity - 100;
      } else {
        if (widget._quantity > 1) widget._quantity = widget._quantity - 1;
      }
    });

    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }

  void addToList() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => OrderWidget(widget._quantity)));
  }

  @override
  Widget build(BuildContext context) {
    var applicationState = Provider.of<CartModel>(context);

    void addstate() {
      if (widget._quantity == 0) {
        return;
      } else {
        ProductInOrder item =
            ProductInOrder(widget.product, widget._quantity, 25);
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
      body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 40),
                    ),
                  ]),
              Column(
                children: [
                  Row(children: [
                    const Text("Calories:"),
                    Text(widget.product.calories.toString()),
                  ]),
                  Row(children: [
                    const Text("Protein:"),
                    Text(widget.product.protein.toString()),
                  ]),
                  Row(children: [
                    const Text("Carbs:"),
                    Text(widget.product.carbs.toString()),
                  ]),
                  Row(children: [
                    const Text("Fat:"),
                    Text(widget.product.fat.toString()),
                  ]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: _remove, icon: Icon(Icons.remove)),
                  Text(
                    widget._quantity.toString(),
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 40),
                  ),
                  Text(
                    " g",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 40),
                  ),
                  IconButton(onPressed: _add, icon: Icon(Icons.add)),
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FloatingActionButton(
                        onPressed: addstate, child: Icon(Icons.add)),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.product
                          .calculatePrice(widget._quantity)
                          .toString(),
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 40),
                    ),
                    Text(
                      "euro",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                  ])
            ]),
          ]),
    );
  }
}
