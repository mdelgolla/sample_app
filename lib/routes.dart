import 'package:flutter/material.dart';
import 'package:sample_app/models/product.dart';
import 'package:sample_app/views/screens/browse_all_products.dart';
import 'package:sample_app/views/screens/home_page_screen.dart';
import 'package:sample_app/views/screens/product_detail_view.dart';

class ScreenRoutes {
  static const String toHomePage = "toHomePage";
  static const String browsAllProducts="browsAllProducts";
  static const String toProductDetailView="toProductDetailView";
}

class Router {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreenRoutes.toHomePage:
        return MaterialPageRoute(builder: (_)=>const HomePageScreen());
      case ScreenRoutes.browsAllProducts:
        return MaterialPageRoute(builder: (_)=>const BrowseAllProducts());
      case ScreenRoutes.toProductDetailView:
        var product=settings.arguments as Product;
        return MaterialPageRoute(builder: (_)=>ProductDetailView(product: product,));
      default:
        return null;
    }

  }
}