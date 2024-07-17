import 'package:flutter/material.dart';

import 'package:shopping_list/data/item_data.dart';

class GroceryItem extends StatelessWidget {
  const GroceryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: ListView.builder(
        itemCount: itemData.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(itemData[index].name),
          leading: Container(
            width: 24,
            height: 24,
            color: itemData[index].categoryModel.color,
          ),
          trailing: Text(itemData[index].quantity.toString()),
        ),
      ),
    );
  }
}
