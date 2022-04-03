import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/models/product.dart';
import 'package:sample_app/routes.dart';
import 'package:sample_app/styles/app_colors.dart';
import 'package:sample_app/styles/app_text_styles.dart';

class ProductItem extends StatelessWidget {
 final Product product;

  const ProductItem(
      {Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ScreenRoutes.toProductDetailView,
            arguments: product);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: const BoxDecoration(
              color: AppColors.bgColorPurple,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(product.model ?? "",style: Theme.of(context).textTheme.categoryHeading,),
                    const Spacer(),
                    const Icon(
                      Icons.favorite,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              CachedNetworkImage(
                imageUrl: product.image ?? "",
                imageBuilder: (context, imageProvider) => AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                // fit: BoxFit.fitHeight,
                placeholder: (context, url) =>
                const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }