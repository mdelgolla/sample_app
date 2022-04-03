import 'package:flutter/material.dart';
import 'package:sample_app/assets.dart';
import 'package:sample_app/styles/app_text_styles.dart';

class CartEmptyView extends StatelessWidget {
  const CartEmptyView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          shoppingCart,
          height: 100,
          width: 100,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Your cart is currently\nempty!",
          style: Theme.of(context).textTheme.normalTextStyle,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}