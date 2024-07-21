import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceModel {
  final String id;
  final String title;

  PlaceModel({required this.title}) : id = uuid.v4();
}
