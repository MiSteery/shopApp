import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_me/providers/cart.dart';
import 'package:shop_me/providers/order.dart';
import 'package:shop_me/providers/products.dart';
import 'package:shop_me/screens/cart_screen.dart';
import 'package:shop_me/screens/edit_product_screen.dart';
import 'package:shop_me/screens/order_screen.dart';
import 'package:shop_me/screens/product_detail_screen.dart';
import 'package:shop_me/screens/products_overview_screen.dart';
import 'package:shop_me/screens/user_products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //return the instance of the class
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Order(),
        ),
        // ChangeNotifierProvider.value(value: Order());
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop Me',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Colors.redAccent,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProuctDetailScreen.routeName: (ctx) => ProuctDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
