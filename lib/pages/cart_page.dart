import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marios_pizza/bloc/cart_bloc.dart';
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

  Widget sectionProducts() {
    return BlocBuilder<CartBloc, CartBlocState>(builder: (context, state) {
      if (state is CartBlocStateLoading) {
        return Center(child: CircularProgressIndicator());
      }
      final productsInCart = (state as CartBlocStateLoaded).cart;
      return SliverList.builder(
        itemCount: productsInCart.length,
        itemBuilder: (context, index) => Container(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              // backgroundColor: ThemeColors.bgAppBar,
              backgroundImage: NetworkImage(
                productsInCart[index].imageUrl,
              ),
              radius: 30,
            ),
            title: Text(
              productsInCart[index].name,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              "€ ${productsInCart[index].price.toStringAsFixed(2)}",
              style: TextStyle(color: Colors.black38),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.remove_circle_outline,
                color: Colors.black38,
              ),
              onPressed: () {
                BlocProvider.of<CartBloc>(context).add(
                    CartBlocEventProductToggle(product: productsInCart[index]));
              },
            ),
          ),
        ),
      );
    });
  }

  Widget sectionCosts() {
    return BlocBuilder<CartBloc, CartBlocState>(builder: (context, state) {
      final productsInCart = (state as CartBlocStateLoaded).cart;
      final subtotal = productsInCart.map((e) => e.price).sum;
      final iva = subtotal * .2;
      final total = subtotal + iva;
      // final productsList = state.productsList;
      return SliverToBoxAdapter(
        child: Column(
          children: [
            RowCheckOut(text: "Subtotale", price: subtotal),
            RowCheckOut(text: "IVA", price: iva),
            ListTile(
              dense: true,
              title: Text(
                "Totale",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: Text(
                "€ ${total.toStringAsFixed(2)}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MaterialButton(
                onPressed: () {},
                child: Text("Paga (€ ${total.toStringAsFixed(2)})"),
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
    });
  }
}
