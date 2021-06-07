import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItem :productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      //gridDelegate definehow the grid generally should be structured
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      //itemBuilder definehow every gird item , cell  is build
      //.value is used because it is using the already create value so it will be effiecient
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value:  products[i],
          child: ProductItem(
        // id: product[i].id,
        // title: product[i].title,
        // imageUrl: product[i].imageUrl,
      ),
      ),
    );
  }
}
