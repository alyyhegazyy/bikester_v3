import 'package:bikesterr/presentation/screens/help.dart';
import 'package:bikesterr/presentation/screens/home_page.dart';
import 'package:bikesterr/presentation/screens/home_screens/all_stations.dart';
import 'package:bikesterr/presentation/screens/home_screens/nearest_stations.dart';
import 'package:bikesterr/presentation/screens/home_screens/start_trip.dart';
import 'package:bikesterr/presentation/screens/login.dart';
import 'package:bikesterr/presentation/screens/home_screens/profile.dart';
import 'package:bikesterr/presentation/screens/signup.dart';
import 'package:bikesterr/presentation/screens/review.dart';
import 'package:bikesterr/presentation/screens/wallet.dart';
//import 'package:bikesterr/presentation/screens/welcome.dart';
import 'package:bikesterr/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'data/models/station_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    home: WelcomeScreen(),
    //   stationModel: StationModel(
    //       address: "test",
    //       stationName: "test name",
    //       lat: "29.964914",
    //       long: "31.269994",
    //       availableBikes: "6"),
    // ),
    debugShowCheckedModeBanner: false,
  ));
}
