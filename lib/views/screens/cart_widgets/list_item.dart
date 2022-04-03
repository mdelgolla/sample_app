import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/bloc/cart/cart_bloc.dart';
import 'package:sample_app/models/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sample_app/styles/app_colors.dart';
import 'package:sample_app/styles/app_text_styles.dart';

class ListItem extends StatelessWidget{
  final Product product;
  const ListItem({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.bgColorPurple,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CachedNetworkImage(
                imageUrl: product.image??"",
                imageBuilder: (context, imageProvider) => Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                // fit: BoxFit.fitHeight,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Expanded(
              child: Column(children: [
                Text(product.model??"",style:Theme.of(context).textTheme.listTitle ,),
                const SizedBox(height: 8,),
                RichText(
                  text: TextSpan(
                    text: 'Rs',
                    style: Theme.of(context).textTheme.listSubTitle,
                    children:  <TextSpan>[
                      TextSpan(text: product.price.toString()),
                    ],
                  ),
                )
              ],),
            ),
           IconButton(onPressed: (){
             context.read<CartBloc>().add(RemoveProductFromCart(product: product));
           }, icon: const Icon(Icons.close,size: 30,color: Colors.white,)),
            const SizedBox(width: 10,),
          ],
        ),
      ),
    );
  }
}