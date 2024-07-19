import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/data/category_data.dart';

import 'package:shopping_list/models/item_model.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<ItemModel> _newItemData = [];
  var _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        'flutter-shopping-list-bd86e-default-rtdb.firebaseio.com',
        'shopping-list.json');
    final response = await http.get(url);
    final Map<String, dynamic> results = json.decode(response.body);

    final List<ItemModel> loadedItems = [];
    for (final item in results.entries) {
      // because we only stored the category title in our db, we need to match it with our categoryData to get the full enum category data
      final category = categoryData.entries
          .firstWhere(
              (catItem) => catItem.value.name == item.value['categoryModel'])
          .value;
      loadedItems.add(ItemModel(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          categoryModel: category));
    }
    setState(() {
      _newItemData = loadedItems;
      _isLoading = false;
    });
  }

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
    Widget content = const Center(
      child: Text('No items added yet!'),
    );

    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    }

    if (_newItemData.isNotEmpty) {
      content = ListView.builder(
        itemCount: _newItemData.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(_newItemData[index].id),
          onDismissed: (direction) {
            setState(() {
              _newItemData.remove(_newItemData[index]);
            });
          },
          child: ListTile(
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
