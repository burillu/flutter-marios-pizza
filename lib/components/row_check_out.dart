import 'package:flutter/material.dart';

class RowCheckOut extends StatelessWidget {
  final String text;
  final double price;

  const RowCheckOut({
    required this.text,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(
        text,
        style: TextStyle(color: Colors.grey[600]),
      ),
      trailing: Text(
        "€ ${price.toStringAsFixed(2)}",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
