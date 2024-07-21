import 'package:favorite_places/models/place_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<PlaceModel>> {
  UserPlacesNotifier()
      : super(
            const []); // this list must not be mutated, that's why it's a 'const'

  void addPlace(String title) {
    final newPlace = PlaceModel(title: title);
    state = [newPlace, ...state];
  }
}

final userPlacesNotifier =
    StateNotifierProvider<UserPlacesNotifier, List<PlaceModel>>(
        (ref) => UserPlacesNotifier());
