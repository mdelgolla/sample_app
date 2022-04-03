import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_app/bloc/product/product_bloc.dart';
import 'package:sample_app/models/category.dart';
import 'package:sample_app/models/product.dart';

part 'filter_product_event.dart';

part 'filter_product_state.dart';

class FilterProductBloc extends Bloc<FilterProductEvent, FilterProductState> {
  final ProductBloc _productBloc;
  late StreamSubscription _productSubscription;

  FilterProductBloc({required ProductBloc productBloc})
      : _productBloc = productBloc,
        super(FilterProductsLoading()) {
    on<FilterProductByCategory>(_filterProduct);
    on<FilterProductBySearch>(_filterProductBySearch);
    _productSubscription = productBloc.stream.listen((event) {
      add(const FilterProductByCategory());
    });
  }

  void _filterProduct(
      FilterProductByCategory event, Emitter<FilterProductState> emit) {
    final state = _productBloc.state;
    if (state is ProductListLoaded) {
      List<Product> productList = state.productList.where((product) {
        switch (event.productFilters) {
          case CategoryFilters.all:
            return true;
          case CategoryFilters.drums:
            return product.category ==
                event.productFilters.toString().split('.').last;
          case CategoryFilters.guitar:
            return product.category ==
                event.productFilters.toString().split('.').last;

          case CategoryFilters.piano:
            return product.category ==
                event.productFilters.toString().split('.').last;
        }
      }).toList();
      emit(FilterProductsLoaded(filteredProducts: productList,categoryFilters:event.productFilters));
    }
  }
  void _filterProductBySearch(FilterProductBySearch event,Emitter<FilterProductState> emit){
    final state = _productBloc.state;
    if (state is ProductListLoaded) {
      List<Product> productList=state.productList.where((product) {
        final searchQuery=event.query.toLowerCase();
        final model=product.model!.toLowerCase();
        return model.contains(searchQuery);
      }).toList();
      emit(FilterProductsLoaded(filteredProducts: productList));
    }
  }
}
