import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shopping_list/data/category_data.dart';
import 'package:shopping_list/models/category_model.dart';
import 'package:shopping_list/models/item_model.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  // this key will help us to validate all widgets inside our form
  // this 'GlobalKey' makes sure even if "build method" executes again, the form keeps its internal state
  // also we can use this GlobalKey to access to the form's state and do things like validation
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categoryData[Categories.vegetables]!;

  void _saveItem() {
    // 'validate' here will trigger 'validator' functions defined in our form
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // 'save' here will trigger 'onSave' functions defined in our form

      // Firebase realtime database in test-mode
      // the path name below (shopping-list) can be anything
      final url = Uri.https(
          'flutter-shopping-list-bd86e-default-rtdb.firebaseio.com',
          'shopping-list.json');
      // headers: key= headers identifier, value= settings for those headers
      http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        // body: convert data to the json format
        // we don't need to pass any id because firebase will generate it for us
        body: json.encode(
          {
            'name': _enteredName,
            'quantity': _enteredQuantity,
            'categoryModel': _selectedCategory.name
          },
        ),
      );

      // Navigator.pop(
      //   context,
      //   ItemModel(
      //       id: DateTime.now().toString(),
      //       name: _enteredName,
      //       quantity: _enteredQuantity,
      //       categoryModel: _selectedCategory),
      // );
    }
  }

  void _resetItem() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // instead of TextField widget
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _enteredName = newValue!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _enteredQuantity.toString(),
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(label: Text('Quantity')),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Enter a valid, positive number.';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _enteredQuantity = int.parse(newValue!);
                      },
                    ),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: [
                        // 'entries' to convert our map items to list items
                        for (final category in categoryData.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.value.name),
                              ],
                            ),
                          ),
                      ],
                      // since we're using onChanged here we no longer need to use onSaved for this widget because we are re-assigning any changes to a variable
                      onChanged: (newValue) {
                        setState(() {
                          // the setState here is required because we used the _selectedCategory as value in our widget therefore these two should be in-sync on any changes
                          _selectedCategory = newValue!;
                        });
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: _resetItem, child: const Text('Reset')),
                  ElevatedButton(
                      onPressed: _saveItem, child: const Text('Add item'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
