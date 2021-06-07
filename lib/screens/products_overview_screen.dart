import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_me/providers/cart.dart';
import 'package:shop_me/screens/cart_screen.dart';
import 'package:shop_me/widgets/app_drawer.dart';
import 'package:shop_me/widgets/badge.dart';
import 'package:shop_me/widgets/product_grid.dart';

enum FiltersOPtions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavoties = false;
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Shop Me'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FiltersOPtions selectedValue) {
              setState(() {
                if (selectedValue == FiltersOPtions.Favorites) {
                  _showOnlyFavoties = true;
                } else {
                  _showOnlyFavoties = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FiltersOPtions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FiltersOPtions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
                child: ch!,
                value: cart.itemCount.toString(),
                color: Colors.redAccent),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavoties),
      //gridView builder optimizes the longer gird views with multiple item
      // body: GridView.builder(
      //   padding: const EdgeInsets.all(10),
      //   itemCount: loadedProducts.length,
      //   //gridDelegate definehow the grid generally should be structured
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     childAspectRatio: 3 / 2,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //   ),
      //   //itemBuilder definehow every gird item , cell  is build
      //   itemBuilder: (ctx, i) => ProductItem(
      //     id: loadedProducts[i].id,
      //     title: loadedProducts[i].title,
      //     imageUrl: loadedProducts[i].imageUrl,
      //   ),
      // ),
    );
    return scaffold;
  }
}
