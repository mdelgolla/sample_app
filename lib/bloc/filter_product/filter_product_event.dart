part of 'filter_product_bloc.dart';

abstract class FilterProductEvent extends Equatable {
  const FilterProductEvent();
}

class FilterProductBySearch extends FilterProductEvent{
  final String  query;

  const FilterProductBySearch({required this.query});
  @override
  // TODO: implement props
  List<Object?> get props => [query];

}
class FilterProductByCategory extends FilterProductEvent{
  final CategoryFilters productFilters;

  const FilterProductByCategory({ this.productFilters=CategoryFilters.all});
  @override
  // TODO: implement props
  List<Object?> get props => [productFilters];

}
