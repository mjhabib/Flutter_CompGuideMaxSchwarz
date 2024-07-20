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
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        'flutter-shopping-list-bd86e-default-rtdb.firebaseio.com',
        'shopping-list.json');

    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        setState(() {
          _error = 'Failed to fetch data, please try again later!';
        });
      }

      // the firebase returns 'null' as string if there is no data in db
      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }

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
    } catch (e) {
      setState(() {
        _error = 'Something went wrong! please try again later.';
      });
    }
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

  void _removeItem(ItemModel item) async {
    final index = _newItemData.indexOf(item);
    setState(() {
      _newItemData.remove(item);
    });

    final url = Uri.https(
        'flutter-shopping-list-bd86e-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');
    final response = await http.delete(url);

    // if something went wrong and we couldn't delete the item from db, we want to 'insert' the item to our list again with the same order as before, that's why we need the 'index' of that item here
    if (response.statusCode >= 400) {
      // optional: show an error message too...
      setState(() {
        _newItemData.insert(index, item);
      });
    }
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
            _removeItem(_newItemData[index]);
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

    if (_error != null) {
      content = Center(child: Text(_error!));
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
