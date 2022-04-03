part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}
class ListCartItems extends CartEvent{
  final List<Product>cartItems;

  const ListCartItems({this.cartItems=const<Product>[]});
  @override
  // TODO: implement props
  List<Object?> get props => [cartItems];

}
class AddProductToCart extends CartEvent{
  final Product product;
  const AddProductToCart({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];

}
class UpdateProductCart extends CartEvent{
  final Product product;

  const UpdateProductCart({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];

}
class RemoveProductFromCart extends CartEvent{
  final Product product;

  const RemoveProductFromCart({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];

}
