import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapplication/user/user.dart';
import 'package:provider/provider.dart';

import 'user.dart';
import '../basket/basket.dart';
import '../basket/basket_widget.dart';
import '../home.dart';

class Profile extends StatelessWidget {
  const Profile(this.user, {Key? key}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    var applicationState = Provider.of<CartModel>(context);

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
        title: const Text(
          "Profile",
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                user.name,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 40),
              )
            ],
          ),
        ],
      ),
    );
  }
}
