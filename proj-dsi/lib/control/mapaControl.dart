// ignore_for_file: unused_element, prefer_const_constructors

import 'package:cardiocare/components/bottombar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

markerInicial(currentPosition) {
  return Marker(
    point: currentPosition,
    width: 30.0,
    height: 30.0,
    child: Transform.translate(
      offset: Offset(0, -10),
      child: Icon(
        Icons.location_on,
        size: 30,
        color: Colors.red,
      ),
    ),
  );
}

markerFarmacias(currentPosition, markers) async {
    final String overpassUrl = 'https://overpass-api.de/api/interpreter';
    final String query = '''
      [out:json];
      (
        node["amenity"="pharmacy"](around:50000,${currentPosition.latitude},${currentPosition.longitude});
      );
      out body;
    ''';

    final response = await http.post(
      Uri.parse(overpassUrl),
      body: {'data': query},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List elements = data['elements'];

      for (var element in elements) {
      final LatLng position = LatLng(
        element['lat'],
        element['lon'],
      );
      markers.add(
        Marker(
          point: position,
          width: 30.0,
          height: 30.0,
          child: Transform.translate(
            offset: Offset(0, 0),
            child: Icon(
              Icons.local_pharmacy,
              size: 25,
              color: Colors.green,
            ),
          ),
        ),
      );
      }
    } else {
      throw Exception('Failed to load nearby pharmacies');
    }

    return markers;
  }

markerHospital(currentPosition, markers) async {
    final String overpassUrl = 'https://overpass-api.de/api/interpreter';
    final String query = '''
      [out:json];
      (
        node["amenity"="hospital"](around:50000,${currentPosition.latitude},${currentPosition.longitude});
      );
      out body;
    ''';

    final response = await http.post(
      Uri.parse(overpassUrl),
      body: {'data': query},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List elements = data['elements'];

      for (var element in elements) {
      final LatLng position = LatLng(
        element['lat'],
        element['lon'],
      );
      markers.add(
        Marker(
          point: position,
          width: 30.0,
          height: 30.0,
          child: Transform.translate(
            offset: Offset(0, 0),
            child: Icon(
              Icons.local_hospital,
              size: 25,
              color: Colors.red,
            ),
          ),
        ),
      );
      }
    } else {
      throw Exception('Failed to load nearby hospitals');
    }

    return markers;
  }