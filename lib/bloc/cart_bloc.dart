import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marios_pizza/model/product_model.dart';

class CartBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBloc() : super(CartBlocStateLoading()) {
    on<CartBlocEventInit>((event, emit) async {
      emit(CartBlocStateLoading());
      await Future.delayed(Duration(seconds: 2));
      emit(CartBlocStateLoaded(productsList: products, cart: []));
    });
  }
}

abstract class CartBlocEvent {}

class CartBlocEventInit extends CartBlocEvent {}

abstract class CartBlocState {}

class CartBlocStateLoading extends CartBlocState {}

class CartBlocStateLoaded extends CartBlocState {
  List<ProductModel> productsList;
  List<ProductModel> cart = [];

  CartBlocStateLoaded({required this.productsList, required this.cart});
}
