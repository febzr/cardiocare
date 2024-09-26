// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cardiocare/components/bottombar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:cardiocare/components/buttons/back_button.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cardiocare/control/mapaControl.dart';
//import 'package:lottie/lottie.dart';

class mapa extends StatefulWidget {
  const mapa({super.key});

  @override
  State<mapa> createState() => _mapa();
}

final MapController mapController = MapController();

class _mapa extends State<mapa> {
  LatLng _currentPosition = LatLng(0,0);
  final MapController _mapController = MapController();
  List<Marker> markers = [];

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _mapController.move(_currentPosition, 17.0);
      markers.add(markerInicial(_currentPosition));
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
              child: Container(decoration: BoxDecoration(border: Border.all(width: 1)),
                width: MediaQuery.of(context).size.width * (377/430), // 70% da largura da tela
                height: MediaQuery.of(context).size.height * (522/932), // 40% da altura da tela
                
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _currentPosition,
                    initialZoom: 15.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png',
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: markers,
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
                    markers.clear();
                    markers.add(markerInicial(_currentPosition));
                    markerFarmacias(_currentPosition, markers);
                    _mapController.move(_currentPosition, 16.0);
                  },
                  child: Text('Filtrar por farmácias'),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                
                ElevatedButton(
                  onPressed: () {
                    markers.clear();
                    markers.add(markerInicial(_currentPosition));
                    markerHospital(_currentPosition, markers);
                    _mapController.move(_currentPosition, 16.0);
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