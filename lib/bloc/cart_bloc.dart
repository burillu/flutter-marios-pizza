import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marios_pizza/model/product_model.dart';

class CartBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBloc() : super(CartBlocStateLoading()) {
    on<CartBlocEventInit>((event, emit) async {
      emit(CartBlocStateLoading());
      await Future.delayed(Duration(seconds: 2));
      emit(CartBlocStateLoaded(productsList: products, cart: []));
    });
    on<CartBlocEventProductToggle>(
      (event, emit) {
        final productList = (state as CartBlocStateLoaded).productsList;
        List<ProductModel> actualCart = (state as CartBlocStateLoaded).cart;

        final product =
            productList.firstWhere((item) => item.name == event.product.name);
        if (product.inShoppingCart) {
          actualCart.remove(product);
        } else {
          actualCart.add(product);
        }
        product.inShoppingCart = !product.inShoppingCart;

        emit(CartBlocStateLoaded(productsList: productList, cart: actualCart));
      },
    );
  }
}

abstract class CartBlocEvent {}

class CartBlocEventInit extends CartBlocEvent {}

class CartBlocEventProductToggle extends CartBlocEvent {
  final ProductModel product;
  CartBlocEventProductToggle({required this.product});
}

abstract class CartBlocState {}

class CartBlocStateLoading extends CartBlocState {}

class CartBlocStateLoaded extends CartBlocState {
  List<ProductModel> productsList;
  List<ProductModel> cart = [];

  CartBlocStateLoaded({required this.productsList, required this.cart});
}
