import 'package:flutter/material.dart';
import 'package:foodapplication/basket/basket.dart';
import 'package:foodapplication/home.dart';
import 'package:foodapplication/user/profile.dart';
import 'package:provider/provider.dart';

class Address_widget extends StatefulWidget {
  const Address_widget({Key? key}) : super(key: key);

  @override
  _Address_widgetState createState() => _Address_widgetState();
}

class _Address_widgetState extends State<Address_widget> {
  final _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var applicationstate = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("E HEALTHY FOOD"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 45),
            TextFormField(
              controller: _address,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter your Address',
                labelStyle: const TextStyle(
                  fontSize: 29,
                  color: Colors.black12,
                ),
              ),
            ),
            GestureDetector(
              // When the child is tapped, show a snackbar.
              onTap: () {
                applicationstate.setAdress(_address.text);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: 'App',
                        )));
              },
              child: Container(
                child: const Text(
                  "Enter address",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                ),
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
