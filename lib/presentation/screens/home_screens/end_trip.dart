import 'package:bikesterr/domain/controllers/trip_controller.dart';
import 'package:bikesterr/presentation/screens/home_page.dart';
import 'package:bikesterr/presentation/screens/review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../../../data/models/station_model.dart';

class EndTrip extends StatefulWidget {
  EndTrip({
    Key? key,
  }) : super(key: key);
//  final StationModel stationModel;

  @override
  State<EndTrip> createState() => _EndTripState();
}

class _EndTripState extends State<EndTrip> {
  var tripCont = Get.put(TripController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addRide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          const Image(
            image: AssetImage(
              'assets/route.png',
            ),
            width: 250,
          ),
          const Center(
              child: Text(
            "Trip Ended Successfully",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("start station: ${tripCont.startStation}"),
              const SizedBox(width: 50),
              Text("End station: ${tripCont.endStation}")
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  """start Time: ${tripCont.startTime!.hour}: ${tripCont.startTime!.minute}: ${tripCont.startTime!.second}""",
                  style: const TextStyle(fontSize: 14))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  """end Time: ${tripCont.endTime!.hour}: ${tripCont.endTime!.minute}: ${tripCont.endTime!.second}""",
                  style: const TextStyle(fontSize: 14))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "trip duration: ${tripCont.tripDuration!.inMinutes} minutes"),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("trip cost: ${tripCont.tripCost} EGP",
                  style: const TextStyle(fontSize: 18))
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "The trip cost ammount will be deducted from your wallet balance",
                  style: TextStyle(fontSize: 12, color: Colors.red))
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange)),
              onPressed: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Review();
                  }));
                });
              },
              child: const Text('review'))
        ],
      ),
    );
  }

  addRide() {
    rides.add({
      'startStation': tripCont.startStation,
      'startTime': tripCont.startTime,
      'endStation': tripCont.endStation,
      'endTime': tripCont.endTime,
      'tripDuration': tripCont.tripDuration,
      'tripCost': tripCont.tripCost,
      'tripId': tripCont.tripId,
    });
  }
}
