import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  final int quan;
  const OrderWidget(this.quan);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
