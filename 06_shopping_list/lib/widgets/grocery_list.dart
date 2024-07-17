import 'package:flutter/material.dart';

import 'package:shopping_list/data/item_data.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryItem extends StatefulWidget {
  const GroceryItem({super.key});

  @override
  State<GroceryItem> createState() => _GroceryItemState();
}

class _GroceryItemState extends State<GroceryItem> {
  void _addItem() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewItem()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
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
