import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

import 'package:provider/provider.dart';

import '../providers/orders.dart' show Order;

import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orderScreen';
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderItem(
          ordersData.orders[i],
        ),
        itemCount: ordersData.orders.length,
      ),
    );
  }
}
