import 'package:flutter/material.dart';
import 'package:marios_pizza/components/row_check_out.dart';
import 'package:marios_pizza/theme/colors.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.bgScaffold,
      appBar: appBar(),
      body: CustomScrollView(
        slivers: [
          sectionProducts(),
          sectionCosts(),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: ThemeColors.bgScaffold,
      centerTitle: true,
      title: Text(
        "Checkout",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  SliverList sectionProducts() {
    return SliverList.builder(
      itemCount: 4,
      itemBuilder: (context, index) => Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            // backgroundColor: ThemeColors.bgAppBar,
            backgroundImage: NetworkImage(
              "https://upload.wikimedia.org/wikipedia/commons/c/c8/Pizza_Margherita_stu_spivack.jpg",
            ),
            radius: 30,
          ),
          title: Text(
            "Pizza Margherita",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            "€ 8.50",
            style: TextStyle(color: Colors.black38),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.remove_circle_outline,
              color: Colors.black38,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter sectionCosts() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          RowCheckOut(text: "Subtotale", price: 34.00),
          RowCheckOut(text: "IVA", price: 6.00),
          ListTile(
            dense: true,
            title: Text(
              "Totale",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            trailing: Text(
              "€ 40,00",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MaterialButton(
              onPressed: () {},
              child: Text("Paga (€ 40,00)"),
              height: 45,
              minWidth: (double.infinity),
              color: Colors.green[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          )
        ],
      ),
    );
  }
}
