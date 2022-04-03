import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_app/controllers/product_controller.dart';
import 'package:sample_app/models/product.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<LoadProducts>(_getProductList);
    on<UpdateProduct>(_updateProductItem);
  }

  Future<void> _getProductList(
      LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductListLoading());
    var _state = await ProductController().getProductList(event);

    emit(_state);
  }

  void _updateProductItem(UpdateProduct event, Emitter<ProductState> emit) {
    final state = this.state;
    if (state is ProductListLoaded) {
      List<Product>productList=(state.productList.map((product) {
        return product.id==event.product.id ? event.product: product;
      })).toList();
      emit(ProductListLoaded(productList: productList));
    }
  }
}
