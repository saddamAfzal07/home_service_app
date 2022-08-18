// ignore_for_file: avoid_print, prefer_final_fields

import 'package:final_year_project/screens/add_ser/check/check_latlong.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

class GetUserCurrentLocation extends StatefulWidget {
  // double latitudedata, longitudedata;
  // String name;

  GetUserCurrentLocation({
    Key? key,
    // required this.latitudedata,
    // required this.longitudedata,
    // required this.name
  }) : super(key: key);

  @override
  State<GetUserCurrentLocation> createState() => _GetUserCurrentLocationState();
}

class _GetUserCurrentLocationState extends State<GetUserCurrentLocation> {
  Completer<GoogleMapController> _controller = Completer();
  // ignore: prefer_const_declarations
  final CameraPosition _kgoogle = CameraPosition(
      target: LatLng(30.165116016977223, 71.51423373398315), zoom: 14.4746);
  double? lat;
  double? lon;

  List<Marker> _marker = [];
  List<LatLng> latlng = [
    LatLng(LatLngCheck.latnumber, LatLngCheck.lonnumber),
  ];

  // ignore: prefer_final_fields

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("latlong ===>>>");
    print(LatLngCheck.latnumber + LatLngCheck.lonnumber);

    getLocation();
    _polyline.add(Polyline(
        polylineId: PolylineId("1"),
        points: latlng,
        color: Colors.red.shade400));
  }

  // ignore: non_constant_identifier_names
  List<Marker> _List = [
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(LatLngCheck.latnumber, LatLngCheck.lonnumber),
        infoWindow: InfoWindow(
          title: LatLngCheck.name,
        )),
  ];
  Set<Polyline> _polyline = {};

  getLocation() async {
    getUserCurrentLocation().then((value) async {
      print("My Current Location");
      print(value.latitude.toString() + " " + value.longitude.toString());

      latlng.add(LatLng(value.latitude, value.longitude));
      _marker.add(
        Marker(
            markerId: const MarkerId("2"),
            position: LatLng(value.latitude, value.longitude),
            infoWindow: InfoWindow(
              title: LatLngCheck.currentuserName,
            )),
      );
      CameraPosition cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 14.4746);
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {});
      _marker.addAll(_List);
    });
    _polyline.add(Polyline(
        polylineId: PolylineId("1"),
        points: latlng,
        color: Colors.red.shade400));
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error==>>" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps"),
      ),
      body: GoogleMap(
        initialCameraPosition: _kgoogle,
        markers: Set<Marker>.of(_marker),
        mapType: MapType.normal,
        compassEnabled: true,
        myLocationEnabled: true,
        polylines: _polyline,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
