import 'dart:convert';
import 'package:sample_app/bloc/product/product_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:sample_app/models/product.dart';

abstract class ProductRepository {
  Future<ProductState> getProductList(LoadProducts event);
}

class ProductController extends ProductRepository {
  @override
  Future<ProductState> getProductList(LoadProducts event) async {
    ProductState productState = ProductListLoading();
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final response = await http
        .get(
      Uri.parse("https://run.mocky.io/v3/919a0d45-c054-4452-8175-65538e554272"),
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        return http.Response("", 408);
      },
    );
    final responseJson = json.decode(response.body);
    if (!responseJson["status"]) {
      return productState = const ProductLoadingError(
          errTitle: "Something went wrong",
          errMsg: "Product loading error! Please try again");
    }
    List<Product> _productList = [];
    List<String> _category = [];
    final dataList = responseJson["result"] as List;
    for (var element in dataList) {
      _productList.add(Product.fromJson(element));
      if (_category.contains(element['category'])) {
        _category.add(element['category']);
      }
    }
    productState =
        ProductListLoaded(productList: _productList, categoryList: _category);
    return productState;
  }

}
