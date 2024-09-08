// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cardiocare/components/bottombar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class mapa extends StatefulWidget {
  const mapa({super.key});

  @override
  State<mapa> createState() => _mapa();
}

final MapController mapController = MapController();

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

class _mapa extends State<mapa> {
  LatLng _currentPosition = LatLng(0,0);
  String _message = "";
  final MapController _mapController = MapController();

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _message = "Lat: ${position.latitude}, Lon: ${position.longitude}";
      _mapController.move(_currentPosition, 13.0);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
                Row(children: [backButton()]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: (180 / 430) * MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * (59 / 932),
                        bottom:
                            MediaQuery.of(context).size.height * (25 / 932)),
                    alignment: Alignment.center,
                    child: Text(
                      'Mapa',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  )
                ])
          ]),
          Flexible(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7, // 80% da largura da tela
                height: MediaQuery.of(context).size.height * 0.4, // 50% da altura da tela
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _currentPosition,
                    initialZoom: 13.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c'],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print(_message);
                  },
                  child: Text('Filtrar por farmácias'),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                
                ElevatedButton(
                  onPressed: () {
                    // Ação do botão 2
                  },
                  child: Text('Filtrar por hospitais'),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigatorBar(),
    );
  }
}