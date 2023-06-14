import 'package:bikesterr/data/models/station_model.dart';
import 'package:bikesterr/presentation/screens/home_screens/destiation_trip.dart';
import 'package:bikesterr/presentation/screens/home_screens/free_trip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';

class StartTrip extends StatefulWidget {
  StartTrip({Key? key, StationModel? model}) : super(key: key) {
    if (model == null) {
      stationModel = stationModel;
      StationModel(
          address: "test",
          stationName: "test name",
          lat: "29.964914",
          long: "31.269994",
          availableBikes: "6");
    }
  }
  StationModel? stationModel;

  @override
  State<StartTrip> createState() => _StartTripState();
}

class _StartTripState extends State<StartTrip> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //addRide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Trip Started"),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            const Image(
                image: AssetImage(
                  'assets/biking.png',
                ),
                width: 250),
            const Spacer(
              flex: 4,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange)),
                onPressed: () {
                  Get.off(() => FreeTrip());
                },
                child: const Text("     Free Trip    ")),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange)),
                onPressed: () {
                  Get.to(() => const DestinationTrip());
                },
                child: const Text("Direct Station")),
            const Spacer(
              flex: 10,
            ),
          ],
        ),
      ),
    );
  }

  // addRide(){
  //   trip.add({
  //     'flag': false,
  //     'begin station Name': widget.stationModel.stationName,
  //     'begin trip': getCurrentTime(),
  //     'end station Name':null.toString(),
  //     'end trip':null.toString(),
  //   });
  // }
  //
  // String getCurrentTime(){
  //   String datetime = DateTime.now().toString();
  //   datetime= DateFormat("MMMM, dd, yyyy").format(DateTime.now());
  //   String hourDate = DateFormat("hh:mm:ss a").format(DateTime.now());
  //   return '$hourDate  $datetime';
  // }
}
