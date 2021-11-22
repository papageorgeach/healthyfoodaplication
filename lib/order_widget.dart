import 'package:flutter/material.dart';

import 'home.dart';

class OrderWidget extends StatelessWidget {
  final int quan;
  const OrderWidget(this.quan);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    const MyHomePage(title: "E-healthyfood")));
          },
        ),
        centerTitle: true,
        title: Text("shop.name"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$quan',
            ),
          ],
        ),
      ),
    );
  }
}
