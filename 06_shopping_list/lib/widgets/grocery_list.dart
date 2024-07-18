import 'package:flutter/material.dart';

import 'package:shopping_list/models/item_model.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<ItemModel> _newItemData = [];

  void _addItem() async {
    final newItem = await Navigator.push<ItemModel>(
      context,
      MaterialPageRoute(builder: (context) => const NewItem()),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _newItemData.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: _newItemData.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(_newItemData[index].name),
          leading: Container(
            width: 24,
            height: 24,
            color: _newItemData[index].categoryModel.color,
          ),
          trailing: Text(_newItemData[index].quantity.toString()),
        ),
      ),
    );
  }
}
