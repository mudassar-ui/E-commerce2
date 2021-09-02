import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';
import '../screens/edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-product';
  // var _isInit = true;
  // var _loading = false;
  // @override
  // void initState() {
  //   // if (_isInit) {
  //   //   setState(() {
  //   //     _loading = true;
  //   //   });
  //   //   Provider.of<Products>(context, listen: false).fetchData().then((_) {
  //   //     setState(() {
  //   //       _loading = false;
  //   //     });
  //   //   }); //NullSafety
  //   // }
  //   // _isInit = false;
  //   super.initState();
  // }

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _loading = true;
  //     });
  //     Provider.of<Products>(context).fetchData().then((_) {
  //       setState(() {
  //         _loading = false;
  //       });
  //     }); //NullSafety
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Yor Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (context, i) => Column(
            children: [
              UserProductItem(
                productsData.items[i].title,
                productsData.items[i].imageUrl,
                productsData.items[i].id,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
