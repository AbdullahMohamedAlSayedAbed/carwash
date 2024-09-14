import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerModel {
  final String name;
  final int id;
  final LatLng latLng;

  MarkerModel({required this.name, required this.id, required this.latLng});
}

List<MarkerModel> places = [
  MarkerModel(name: 'Car Wash 1', id: 1, latLng: const LatLng(30.3333333, 31.4444444)),
  MarkerModel(name: 'Car Wash 2', id: 2, latLng: const LatLng(30.6666666, 31.6666666)),
  MarkerModel(name: 'Car Wash 3', id: 3, latLng: const LatLng(30.8888888, 31.8888888)),
];
