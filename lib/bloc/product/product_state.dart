part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductListLoading extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ProductListLoaded extends ProductState {
  final List<Product> productList;
  final List<String> categoryList;

  const ProductListLoaded(
      {this.productList = const <Product>[], this.categoryList = const <String>[]});

  @override
  // TODO: implement props
  List<Object?> get props => [productList,categoryList];
}
class ProductLoadingError extends ProductState{
  final String errTitle;
  final String errMsg;

  const ProductLoadingError({this.errTitle="", this.errMsg=""});

  @override
  // TODO: implement props
  List<Object?> get props => [errTitle,errMsg];
}
