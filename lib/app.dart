import 'package:flutter/material.dart';
import 'package:marios_pizza/pages/cart_page.dart';
import 'package:marios_pizza/pages/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (_) => HomePage(),
        "/cart": (_) => CartPage(),
      },
    );
  }
}
