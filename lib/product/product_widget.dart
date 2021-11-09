import 'package:flutter/material.dart';
import 'product.dart';

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
}
