import 'dart:async';

import 'package:bikesterr/constants.dart';
import 'package:bikesterr/data/models/station_model.dart';
import 'package:bikesterr/data/models/trip_info.dart';
import 'package:bikesterr/presentation/screens/home_page.dart';
import 'package:bikesterr/presentation/screens/picked_station.dart';
import 'package:bikesterr/presentation/screens/wallet.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TripListTile extends StatelessWidget {
  final tripInfo;

  const TripListTile({super.key, required this.tripInfo});

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
                leading:
                    const Icon(Icons.trip_origin_sharp, color: Colors.black),
                title: Text(
                  " start time: ${tripInfo["startTime"]} , end time:  ${tripInfo["endTime"]}",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  """ start station: ${tripInfo["startStation"]} , end station: ${tripInfo["endStation"]} 
duration:${tripInfo["tripDuration"]} , cost:${tripInfo["tripCost"]}""",
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  size: 40,
                ),
                onTap: () {},
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
}
