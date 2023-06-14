import 'dart:developer';

import 'package:bikesterr/data/models/trip_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class TripController extends GetxController {
  var tripIsRunning = false.obs;
  DateTime? tripStartTime;
  DateTime? tripEndTime;
  Duration? tripDuration;
  bool dataIsReady = false;
  startTrip() {
    tripIsRunning.value = true;
    tripStartTime = DateTime.now();
  }

  endTrip() {
    tripIsRunning.value = false;
    tripEndTime = DateTime.now();
    calculateTripDuration();
  }

  calculateTripDuration() {
    tripDuration = tripEndTime!.difference(tripStartTime!);
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
