import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marios_pizza/app.dart';
import 'package:marios_pizza/bloc/cart_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => CartBloc(),
    ),
  ], child: App()));
}
