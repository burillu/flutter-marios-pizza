import 'package:flutter/material.dart';
import 'package:marios_pizza/model/product_model.dart';
import 'package:marios_pizza/theme/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.bgScaffold,
      floatingActionButton: IconButton(
        icon: Icon(Icons.shopping_cart_outlined),
        onPressed: () {
          Navigator.pushNamed(context, "/cart");
        },
      ),
      appBar: appBar(),
      body: sectionProduct(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: ThemeColors.bgScaffold,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "MARIO'S",
            style: TextStyle(
                letterSpacing: 2, fontSize: 24, fontWeight: FontWeight.bold),
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

  Widget sectionProduct() {
    return GridView.builder(
        padding: EdgeInsets.fromLTRB(12, 50, 12, 100),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.all(2),
          );
        });
  }
}
