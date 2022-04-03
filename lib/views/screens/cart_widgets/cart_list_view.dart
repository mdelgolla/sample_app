import 'package:flutter/material.dart';
import 'package:sample_app/models/product.dart';
import 'package:sample_app/styles/app_colors.dart';
import 'package:sample_app/views/screens/cart_widgets/list_item.dart';
import 'package:sample_app/styles/app_text_styles.dart';

class CartListView extends StatelessWidget {
  final List<Product> cartList;
  final double total;

  const CartListView({Key? key, required this.cartList, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: cartList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListItem(product: cartList.elementAt(index));
            }),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          height: 2,
          color: AppColors.kPrimaryColor,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              "Total",
              style: Theme.of(context).textTheme.heading,
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                text: 'Rs ',
                style: Theme.of(context).textTheme.heading,
                children: <TextSpan>[
                  TextSpan(
                    text: total.toString(),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
