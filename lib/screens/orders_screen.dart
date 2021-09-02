import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

import 'package:provider/provider.dart';

import '../providers/orders.dart' show Order;

import '../widgets/order_item.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/orderScreen';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isLoading = false;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Order>(context, listen: false).fetchAndSetOrders();
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (ctx, i) => OrderItem(
                ordersData.orders[i],
              ),
              itemCount: ordersData.orders.length,
            ),
    );
  }
}
