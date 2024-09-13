import 'package:flutter/material.dart';
import 'package:marios_pizza/model/product_model.dart';
import 'package:marios_pizza/theme/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.bgScaffold,
      floatingActionButton: IconButton(
        iconSize: 35,
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(ThemeColors.bgAppBar),
            minimumSize: WidgetStateProperty.all(Size(60, 60))),
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
            childAspectRatio: 3 / 4,
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.all(2),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            products[index].imageUrl,
                          ),
                          fit: BoxFit.cover,
                        )),
                    // child:
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  products[index].name,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  products[index].price.toString(),
                  style: TextStyle(color: Colors.black38),
                ),
                SizedBox(
                  height: 5,
                ),
                MaterialButton(
                  onPressed: () {},
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black26),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text("Seleziona"),
                ),
              ],
            ),
          );
        });
  }
}
