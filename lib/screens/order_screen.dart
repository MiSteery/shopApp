import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_me/widgets/app_drawer.dart';
import 'package:shop_me/providers/order.dart' show Order;
import 'package:shop_me/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName ='/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
      ),
    );
  }
}
