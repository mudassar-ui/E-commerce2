import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:provider/provider.dart';

import '../widgets/product_items.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    print(productData);
    final productItems =
        showFavs ? productData.favoriteItems : productData.items;
    print(productItems);
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: productItems.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: productItems[i],
        child: ProductItem(
            // productItems[i].id,
            // productItems[i].title,
            // productItems[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
