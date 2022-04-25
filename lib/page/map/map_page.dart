import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlng/latlng.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // child: FlutterMap(
          //   options: MapOptions(
          //     center: LatLng(51.5, -0.09),
          //     // center: LatLng(51.5, -0.09),
          //     zoom: 13.0,
          //   ),
          //   layers: [
          //     TileLayerOptions(
          //         urlTemplate:
          //             "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          //         subdomains: ['a', 'b', 'c']),
          //     MarkerLayerOptions(
          //       markers: [
          //         Marker(
          //           width: 80.0,
          //           height: 80.0,
          //           point: LatLng(51.5, -0.09),
          //           // point: LatLng(51.5, -0.09),
          //           builder: (ctx) => Container(
          //             child: FlutterLogo(),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
