import 'dart:developer' as dev;
import 'dart:math';
import 'dart:async';
import 'package:bikesterr/data/models/trip_info.dart';
import 'package:bikesterr/presentation/screens/home_screens/nearest_stations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../constants.dart';

class TripController extends GetxController {
  var allTrips = [].obs;
  var allTripsJson = [].obs;

  var tripIsRunning = false.obs;
  String? startStation;
  String? endStation;
  DateTime? startTime;
  DateTime? endTime;
  Duration? tripDuration;
  num? tripCost;
  String? tripId;
  bool dataIsReady = false;

  startTrip() {
    tripIsRunning.value = true;
    startTime = DateTime.now();
  }

  endTrip() {
    tripIsRunning.value = false;
    endTime = DateTime.now();
    calculateTripDuration();
    calculateTripCost();
  }

  calculateTripDuration() {
    tripDuration = endTime!.difference(startTime!);
    var rand = Random().nextInt(1000);
    tripId = "$rand$startTime$endTime";
    tripCost = (tripDuration!.inMinutes * 2);
  }

  calculateTripCost() {
    tripCost = (tripDuration!.inMinutes * 2);
  }

  storeTripData() {
    firestore.collection("users").doc(tripId).set({
      "startStation": startStation,
      "endStation": endStation,
      "startTime": startTime,
      "endTime": endTime,
      "tripDuration": tripDuration,
      "tripCost": tripCost,
      "tripId": tripId,
    });
  }

  getTrips() async {
    dev.log("get trips started");

    final CollectionReference myCollectionn = firestore.collection('rides');

    QuerySnapshot snapshot = await myCollectionn.get();
    var tripList = snapshot.docs;

    dev.log('${snapshot.docs.length}');

    for (var documentSnapshot in tripList) {
      // Access each document here
      var map = documentSnapshot.data() as Map<String, dynamic>;
      //var tripModel = TripInfo.fromJson(map);
      allTripsJson.value.add(map);
    }

    dev.log('trips: ${allTripsJson.length}');
  }

//   getTrips() async {
//     log("get trips started");
// print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
//     final CollectionReference myCollection = firestore.collection('ride trip');

//     QuerySnapshot snapshot = await myCollection.get();
//     var tripsList = snapshot.docs;

//     log('${snapshot.docs.length}');

//     for (var documentSnapshot in tripsList) {
//       // Access each document here
//       var map = documentSnapshot.data() as Map<String, dynamic>;
//       var tripInfo = TripInfo.fromJson(map);
//       trips.value.add(tripInfo);
//     }

//     log('trips: ${trips.length}');
//   }
}
