import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/bloc/cart/cart_bloc.dart';
import 'package:sample_app/models/product.dart';
import 'package:sample_app/routes.dart';
import 'package:sample_app/views/common_widgets/app_page_layout.dart';
import 'package:sample_app/views/common_widgets/common_button.dart';
import 'package:sample_app/styles/app_text_styles.dart';
import 'package:sample_app/views/screens/cart_widgets/cart_empty_view.dart';
import 'package:sample_app/views/screens/cart_widgets/cart_list_view.dart';
import 'package:sample_app/views/screens/cart_widgets/list_item.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  Widget body = Container();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppPageLayout(
        title: "Bless",
        bottomWidget: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartListLoaded) {
              return Row(
                children: [
                  Expanded(
                      child: CommonButton(
                    buttonLabel: "Brows Items",
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ScreenRoutes.browsAllProducts);
                    },
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  state.productList.isEmpty
                      ? Container()
                      : Expanded(
                          child: CommonButton(
                          buttonLabel: "Check out",
                          onPressed: () {
                            // Navigator.pushNamed(
                            //     context, ScreenRoutes.browsAllProducts);
                          },
                        ))
                ],
              );
            } else {
              return CommonButton(
                buttonLabel: "Brows Items",
                onPressed: () {
                  Navigator.pushNamed(context, ScreenRoutes.browsAllProducts);
                },
              );
            }
          },
        ),
        body: Column(
          children: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartListLoaded) {
                  if (state.productList.isEmpty) {
                    return const Expanded(
                      child: CartEmptyView(),
                    );
                  } else {
                    return CartListView(cartList: state.productList, total: state.total);
                  }
                } else {
                  return const CartEmptyView();
                }
              },
            ),
          ],
        ));
  }

  Widget _cartList(List<Product> cartList, double total) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: cartList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListItem(product: cartList.elementAt(index));
            }),
        Row(
          children: [
            Text("Total"),
            const Spacer(),
            RichText(
              text: TextSpan(
                text: 'Rs ',
                style: Theme.of(context).textTheme.normalTextStyle,
                children: <TextSpan>[
                  TextSpan(
                      text: total.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
