import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/assets.dart';
import 'package:sample_app/bloc/filter_product/filter_product_bloc.dart';
import 'package:sample_app/models/category.dart';
import 'package:sample_app/styles/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final CategoryFilters categoryType;
  final int index;
  final String? category;

  const CategoryItem(
      {Key? key, required this.categoryType, required this.index,this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String category = mainCategoryType.toString().split('.').last;
    return InkWell(
      onTap: (){
        context
            .read<FilterProductBloc>()
            .add(FilterProductByCategory(productFilters:categoryType));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              color: index % 3 == 0
                  ? AppColors.pink
                  : index % 3 == 1
                      ? AppColors.yellow
                      : AppColors.green,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          height: 50,
          width: MediaQuery.of(context).size.width * 0.3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  _getImageIcon(categoryType),
                  height: 30,
                  width: 30,
                  color: Colors.white,
                ),
                const Spacer(),
                Text(
                    "${category![0].toUpperCase()}${category!.substring(1).toLowerCase()}",style: const TextStyle(color:Colors.white,),),
                const SizedBox(width: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getImageIcon(CategoryFilters mainCategoryType) {
    switch (mainCategoryType) {
      case CategoryFilters.guitar:
        return guitar;
      case CategoryFilters.piano:
        return piano;
      case CategoryFilters.drums:
        return drum_set;
      default:
        return guitar;
    }
  }
}
