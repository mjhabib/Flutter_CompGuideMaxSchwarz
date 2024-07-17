import 'package:shopping_list/models/item_model.dart';
import 'package:shopping_list/models/category_model.dart';
import 'package:shopping_list/data/category_data.dart';

final itemData = [
  ItemModel(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      categoryModel: categoryData[Categories.dairy]!),
  ItemModel(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      categoryModel: categoryData[Categories.fruit]!),
  ItemModel(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      categoryModel: categoryData[Categories.meat]!),
];
