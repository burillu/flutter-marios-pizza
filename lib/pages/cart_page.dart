import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar());
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Mario's Pizza",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Guaranteed Italian Pizza",
            style: TextStyle(fontSize: 15, color: Colors.black38),
          )
        ],
      ),
    );
  }
}
