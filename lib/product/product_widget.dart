import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'product.dart';
/*
class ProductWidget extends StatelessWidget {
  Product product;
  ProductWidget(this.product, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: Text(
          product.name,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 40),
        ),
      ),
    );
  }
}*/

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
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
      ]),
    );
  }
}
