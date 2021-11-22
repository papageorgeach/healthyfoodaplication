import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'basket/basket.dart';
import 'shop/shop_shortcut.dart';
import 'product/product.dart';
import 'home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'E-healthy food'),
    );
  }
}
