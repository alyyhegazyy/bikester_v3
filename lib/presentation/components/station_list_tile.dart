import 'dart:async';

import 'package:bikesterr/data/models/station_model.dart';
import 'package:bikesterr/presentation/screens/home_page.dart';
import 'package:bikesterr/presentation/screens/picked_station.dart';
import 'package:bikesterr/presentation/screens/wallet.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class StationListTile extends StatelessWidget {
  final StationModel stationModel;

  const StationListTile({super.key, required this.stationModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(50),
            //color: Colors.blue[200],
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.ev_station, color: Colors.black),
                title: Text(
                  " ${stationModel.stationName}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle:
                    Text("Bikes Available: ${stationModel.availableBikes}"),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  size: 40,
                ),
                onTap: () {
                  Get.to(() async {
                    // const PickedStation()
                    var pos = await _determinePosition();
                    String url =
                        'https://www.google.com/maps/dir/?api=1&origin=${pos.latitude.toString()},${pos.longitude.toString()}&destination=${stationModel.lat.toString()},${stationModel.long.toString()}&travelmode=driving&dir_action=navigate';
                    _launchURL(url);
                  });
                },
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
                dense: true,
                enabled: true,
                //selected: true,
                //selectedColor: Colors.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("can\'t launch $url")));
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnable;
    LocationPermission locationPermission;

    serviceEnable = await Geolocator.isLocationServiceEnabled();

    try {
      serviceEnable;
    } catch (e) {}

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location Permission denied');
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location Permission are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();
    print('current pos when pressed station is $position');
    return position;
  }
}
