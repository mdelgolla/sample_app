import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/assets.dart';
import 'package:sample_app/bloc/filter_product/filter_product_bloc.dart';
import 'package:sample_app/models/product.dart';
import 'package:sample_app/routes.dart';
import 'package:sample_app/styles/app_colors.dart';
import 'package:sample_app/models/category.dart';
import 'package:sample_app/styles/app_text_styles.dart';
import 'package:sample_app/views/screens/product_widgets/category_item.dart';
import 'package:sample_app/views/screens/product_widgets/product_item.dart';

class BrowseAllProducts extends StatefulWidget {
  const BrowseAllProducts({Key? key}) : super(key: key);

  @override
  _BrowseAllProductsState createState() => _BrowseAllProductsState();
}

class _BrowseAllProductsState extends State<BrowseAllProducts> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("BLISS",style: Theme.of(context).textTheme.titleTextStyle,),
                    const Spacer(),
                    const CircleAvatar(
                      radius: 40,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey),
                      borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: ListTile(
                    title: TextField(
                      controller: controller,
                      onChanged: (String query) {
                        context
                            .read<FilterProductBloc>()
                            .add(FilterProductBySearch(query: query));
                      },
                      decoration: const InputDecoration(
                          hintText: 'Search your model', border: InputBorder.none),
                      // onChanged: onSearchTextChanged,
                    ),
                    leading: const Icon(Icons.search),
                    trailing: IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        controller.clear();
                        // onSearchTextChanged('');
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<FilterProductBloc, FilterProductState>(
                  builder: (context, state) {
                    if (state is FilterProductsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is FilterProductsLoaded) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("By Category",
                              style:
                                  Theme.of(context).textTheme.categoryHeading),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 70,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: CategoryFilters.values.length-1,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return CategoryItem(
                                    categoryType: CategoryFilters.values
                                        .elementAt(index+1),
                                    index: index,
                                    category: CategoryFilters.values
                                        .elementAt(index+1)
                                        .toString()
                                        .split('.')
                                        .last,
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text("Most Popular",
                              style:
                                  Theme.of(context).textTheme.categoryHeading),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: ListView.builder(
                                itemCount: state.filteredProducts.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return ProductItem(
                                      product:state.filteredProducts.elementAt(index));
                                }),
                          ),
                        ],
                      );
                    }
                    // if (state is ProductLoadingError) {
                    //   return Center(
                    //     child: Text(state.errMsg),
                    //   );
                    // }
                    else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getList() {
    List<Widget> childs = [];
    for (var i = 0; i < MainCategoryTypes.values.length; i++) {}
    return childs;
  }

}
