import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_app/models/product.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<ListCartItems>(_onLoadCartItems);
    on<AddProductToCart>(_addProductToCart);
    on<UpdateProductCart>(_updateCartItem);
    on<RemoveProductFromCart>(_removeItemFroCart);
  }

  void _onLoadCartItems(ListCartItems event, Emitter<CartState> emit) async{
   double total=await _calculateTotal(event.cartItems);
    emit(CartListLoaded(productList: event.cartItems,total: total));
  }

  void _addProductToCart(AddProductToCart event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartListLoaded) {
      double total=state.total+event.product.price;
      emit(CartListLoaded(productList: List.from(state.productList)..add(event.product),total: total));
    }
  }

  void _updateCartItem(UpdateProductCart event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartListLoaded) {
      List<Product>cartItems=(state.productList.map((product) {
        return product.id==event.product.id ? event.product: product;
      })).toList();
      emit(CartListLoaded(productList: cartItems));
    }
  }

  void _removeItemFroCart(
      RemoveProductFromCart event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartListLoaded) {
      double total=state.total-event.product.price;
      List<Product> cartList = state.productList.where((product) {
        return product.id != event.product.id;
      }).toList();
      emit(CartListLoaded(productList: cartList,total: total));
    }
  }

  Future<double> _calculateTotal(List<Product> cartList) async {
    var sum = 0.0;
    for (var i = 0; i < cartList.length; i++) {
      sum += cartList[i].price;
    }
    print("Sum : ${sum}");
    return sum;
  }
}
