import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:lampada_frontend/model/locale_model.dart';
import 'package:lampada_frontend/page/landing/landing_page.dart';
import 'package:lampada_frontend/page/list/list_page.dart';
import 'package:lampada_frontend/service/api_service.dart';
import 'package:latlong2/latlong.dart';

import '../../core/core.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  List<LocaleModel> locales = [];

  Future<void> loadInitialData() async {
    ApiService apiService = ApiService();
    try {
      var response = await apiService.get("local/pega_tudo");
      for (var d in response) {
        locales.add(LocaleModel(
          id: d["id"],
          descricao: d["nome"],
          latitude: d["latitude"],
          longitude: d["longitude"],
        ));
        // locales.add(LocaleModel.fromJson(d));
        // print(d["descricao"]);

      }
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: FlutterMap(
        options: MapOptions(
          center: LatLng(-23.6927393, -46.6738335),
          zoom: 15.0,
        ),
        //latitude: -23.6927393, longitude: -46.6738335
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
              markers: locales
                  .map((l) => Marker(
                        width: 200.0,
                        height: 200.0,
                        point: LatLng(l.latitude!, l.longitude!),
                        builder: (ctx) => Column(
                          children: [
                            Text(
                              l.descricao?.toString() ?? "",
                              style: AppTextStyles.p_bold_secondary,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.person_pin,
                                size: 48,
                              ),
                              color: Colors.pinkAccent,
                              onPressed: () {
                                Get.offAll(LandingPage(
                                  body: ListPage(type: ListType.photo),
                                ));
                                print("Latitude: ${l.latitude}");
                                print("Longitude: ${l.longitude}");
                              },
                            ),
                          ],
                        ),
                      ))
                  .toList())
        ],
      )),
    );
  }
}
