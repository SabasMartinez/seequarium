import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocateScreen extends StatefulWidget {
  const LocateScreen({super.key});

  @override
  State<LocateScreen> createState() => _LocateScreenState();
}

class _LocateScreenState extends State<LocateScreen> {
  final LocationSettings locsettings = const LocationSettings(
    accuracy: LocationAccuracy.high, // high accuracy
    distanceFilter: 5, // in meters
  );

  late Future<Position> position; //holds pos information\
  late StreamSubscription<Position> stream;

  late GoogleMapController mapController;

  late LatLng _center;

//look into darkmode map creation.
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

//the following is referenced from pub.dev geolocator example

  /// Determine the current position of the device.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void setInitialLocation() async {
    position = _determinePosition();
    Position pos = await _determinePosition();
    _center = LatLng(pos.latitude, pos.longitude);
  }

  @override
  void initState() {
    //class example reference to initialize
    super.initState();
    setInitialLocation();
    stream = Geolocator.getPositionStream(
      locationSettings: locsettings,
    ).listen((pos) {
      //listen for changes in position
      position = Future.value(pos);
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(pos.latitude, pos.longitude),
            zoom: 11.0,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: position,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 13.0,
                  ),
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  // liteModeEnabled: true,
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
