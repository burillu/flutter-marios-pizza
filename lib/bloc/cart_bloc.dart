import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marios_pizza/model/product_model.dart';

class CartBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBloc() : super(CartBlocStateContent([]));
}

abstract class CartBlocEvent {}

abstract class CartBlocState {}

class CartBlocStateContent extends CartBlocState {
  List<ProductModel> products;

  CartBlocStateContent(this.products);
}
