import 'package:favorite_places/models/place_model.dart';

import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  final PlaceModel place;
  const PlaceDetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.network(
            place.imageNetwork,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
