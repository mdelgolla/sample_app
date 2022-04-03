part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartListLoaded extends CartState {
  final List<Product> productList;
  final double total;

  const CartListLoaded(
      {this.productList = const <Product>[],this.total=0.0});

  @override
  // TODO: implement props
  List<Object?> get props => [productList];
}
