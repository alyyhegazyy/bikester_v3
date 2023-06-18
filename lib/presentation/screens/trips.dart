import 'dart:async';

import 'package:bikesterr/data/models/station_model.dart';
import 'package:bikesterr/domain/controllers/stations_controller.dart';
import 'package:bikesterr/domain/controllers/trip_controller.dart';
import 'package:bikesterr/presentation/components/appbar.dart';
import 'package:bikesterr/presentation/components/drawer.dart';
import 'package:bikesterr/presentation/components/station_list_tile.dart';
import 'package:bikesterr/presentation/components/trip_list_tile%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants.dart';

class Trips extends StatefulWidget {
  Trips({super.key});

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppbar(),
        drawer: MyDrawer(),
        body: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TripListTile(
                  tripInfo: tripController.allTripsJson.value[index]);
            },
            itemCount: trips.length,
          ),
        ));
  }
}
