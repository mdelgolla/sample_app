part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class LoadProducts extends ProductEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class UpdateProduct extends ProductEvent{
  final Product product;

  const UpdateProduct({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];

}

