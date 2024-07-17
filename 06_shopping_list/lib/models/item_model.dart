import 'package:shopping_list/models/category_model.dart';

class ItemModel {
  final String id;
  final String name;
  final int quantity;
  final CategoryModel categoryModel;

  const ItemModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.categoryModel,
  });
}
