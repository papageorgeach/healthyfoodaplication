import 'dart:io';
import 'package:flutter/material.dart';
import 'package:animated_check/animated_check.dart';
import 'package:foodapplication/home.dart';
import 'package:foodapplication/product/products_in_order_widget.dart';
import 'package:provider/provider.dart';
import 'basket/basket.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = new Tween<double>(begin: 0, end: 1).animate(
        new CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutCirc));
  }

  @override
  Widget build(BuildContext context) {
    var applicationState = Provider.of<CartModel>(context);

    _animationController.forward();

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.center,
            child: Column(children: const [
              Text(
                "Order on the way !",
                style: TextStyle(fontSize: 40),
              )
            ]),
          ),
          Container(
              child: AnimatedCheck(
            progress: _animation,
            size: 200,
          )),
          GestureDetector(
              // When the child is tapped, show a snackbar.
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyHomePage(title: "E-healthy food")));
                //applicationState.removeAll();
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(children: const [
                  Text(
                    "go back",
                    style: TextStyle(fontSize: 25),
                  )
                ]),
              )),
          GestureDetector(
              // When the child is tapped, show a snackbar.
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OrdersProducts()));
                //applicationState.removeAll();
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.center,
                child: Column(children: const [
                  Text(
                    "Order's details",
                    style: TextStyle(fontSize: 18),
                  )
                ]),
              ))
        ],
      ),
    ));
  }
}
