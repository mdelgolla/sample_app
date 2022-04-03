part of 'filter_product_bloc.dart';

abstract class FilterProductState extends Equatable {
  const FilterProductState();
}

class FilterProductInitial extends FilterProductState {
  @override
  List<Object> get props => [];
}


class FilterProductsLoading extends FilterProductState {
  @override
  List<Object> get props => [];
}

class FilterProductsLoaded extends FilterProductState {
  final List<Product>filteredProducts;
  final CategoryFilters categoryFilters;

  const FilterProductsLoaded({required this.filteredProducts, this.categoryFilters=CategoryFilters.all});
  @override
  List<Object> get props => [filteredProducts,categoryFilters];
}
