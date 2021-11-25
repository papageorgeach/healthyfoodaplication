import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'address/address.dart';
import 'address/address_widget.dart';
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
      darkTheme: ThemeData(
        brightness: Brightness.light,
        /* dark theme settings */
      ),
      home: const Address_widget(),
    );
  }
}
