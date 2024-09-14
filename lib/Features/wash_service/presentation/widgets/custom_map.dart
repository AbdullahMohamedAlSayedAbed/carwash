import 'dart:async';

import 'package:carwash/Features/wash_service/presentation/views/services/marker_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({super.key});

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  //
  // Future<Position>
  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled == false) {
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      return Future.error('Location permissions are denied');
    }
    if (permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition();
      debugPrint('${position.latitude}');
      debugPrint('${position.longitude}');
    }
// AIzaSyBzKFU-TDLRO2kAoHAdgiil4zPw2GrC9OE
  }

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.4434592, 31.6877141),
    zoom: 7.5,
  );

// init state
  @override
  void initState() {
    _determinePosition();
    initMarkers();
    super.initState();
  }

  Set<Marker> markers = <Marker>{};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: GoogleMap(
        markers: markers,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  void initMarkers() {
    var myMarkers = places
        .map(
          (toElement) => Marker(
            infoWindow: InfoWindow(title: toElement.name),
            markerId: MarkerId(toElement.id.toString()),
            position: toElement.latLng,
          ),
        )
        .toSet();
    markers.addAll(myMarkers);
  }
}
