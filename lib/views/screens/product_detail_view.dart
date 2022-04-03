import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/bloc/cart/cart_bloc.dart';
import 'package:sample_app/bloc/product/product_bloc.dart';
import 'package:sample_app/models/product.dart';
import 'package:sample_app/routes.dart';
import 'package:sample_app/styles/app_colors.dart';
import 'package:sample_app/views/common_widgets/common_button.dart';

class ProductDetailView extends StatefulWidget {
  final Product product;

  const ProductDetailView({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  bool _addToVavourite = false;

  @override
  Widget build(BuildContext context) {
    return
        // BlocListener<CartBloc, CartState>(
        // listener: (context, state) {
        //   if(state is CartListLoaded){
        //
        //   }
        // },
        // child:
        Scaffold(
      backgroundColor: AppColors.bgColorPurple,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.share,
                  size: 26.0,
                ),
              )),
          BlocListener<ProductBloc, ProductState>(
            listener: (context, state) {
              if(state is ProductListLoaded){

              }
            },
            child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    context.read<ProductBloc>().add(UpdateProduct(
                        product: widget.product.copyWith(isFavourite: true)));
                  },
                  child: Icon(
                    Icons.favorite,
                    size: 26.0,
                    color:
                        widget.product.isFavourite ? Colors.red : Colors.white,
                  ),
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  _addToCart(context, widget.product);
                },
                child: const Icon(
                  Icons.shopping_cart,
                  size: 26.0,
                ),
              )),
        ],
        // backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Container(
        color: AppColors.bgColorPurple,
        child: CachedNetworkImage(
          imageUrl: widget.product.image ?? "",
          imageBuilder: (context, imageProvider) => AspectRatio(
            aspectRatio: 1,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          // fit: BoxFit.fitHeight,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
      bottomSheet: BottomSheet(
        // backgroundColor: AppColors.bgColorPurple.withOpacity(0.3),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            color: AppColors.bgColorPurple.withOpacity(0.3),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.model ?? "",
                      textAlign: TextAlign.start,
                    ),
                    _bottomSheetItem("Brand", widget.product.brand ?? ""),
                    _bottomSheetItem(
                        "Price", "Rs " + widget.product.price.toString()),
                    _bottomSheetItem("Color", widget.product.color ?? ""),
                    _bottomSheetItem("Weight", widget.product.weight ?? ""),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: CommonButton(
                      height: 40,
                      buttonLabel: "Add to cart",
                      onPressed: () {
                        _addToCart(context, widget.product);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        onClosing: () {},
      ),
    );
    // );
  }

  Widget _bottomSheetItem(String name, String value) {
    return Row(
      children: [Text(name), Spacer(), Text(value)],
    );
  }

  void _addToCart(BuildContext context, Product product) {
    context.read<CartBloc>().add(AddProductToCart(product: product));
    Navigator.pushNamedAndRemoveUntil(
        context, ScreenRoutes.toHomePage, (route) => false);
  }
}
