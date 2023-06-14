import 'dart:async';
import 'dart:convert';
import 'package:bikesterr/presentation/screens/home_screens/free_trip.dart';
import 'package:bikesterr/presentation/screens/home_screens/scan_qr.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants.dart';
import '../../../data/models/station_model.dart';
import '../../../domain/controllers/polyline_response.dart';
import '../../../domain/controllers/stations_controller.dart';

class NearestStation extends StatefulWidget {
  const NearestStation({super.key});

  @override
  State<NearestStation> createState() => _NearestStationState();
}

class _NearestStationState extends State<NearestStation> {
  StationModel? model;
  CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(30.0444, 31.2357), zoom: 14);
  Set<Marker> markers = {};
  PolylineResponse polylineResponse = PolylineResponse();
  String kApiGoogle = 'AIzaSyAZTVndYd4dtsbBVNDbkWRMBdoR7pxztS8';
  GoogleMapController? googleMapController;
  var stationController = Get.put(StationsController());
  late Position position;
  StationModel? nearestStation;
  Set<Polyline> polylinePoints = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getPosition();
    //getNearestStation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        polylines: polylinePoints,
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
              onPressed: () {
                getDistanceInMap(context);
              },
              backgroundColor: Colors.orange,
              label: const Text("Get Nearest Station")),
          SizedBox(
            height: 5,
          ),
          FloatingActionButton.extended(
              onPressed: () {
                print("QR button pressed ....");
                Future.delayed(Duration.zero, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScanQr(
                      stationModel: model ??
                          StationModel(
                              address: "test",
                              stationName: "test name",
                              lat: "29.964914",
                              long: "31.269994",
                              availableBikes: "6"),
                    );
                  }));
                });
              },
              backgroundColor: Colors.orange,
              label: const Icon(Icons.qr_code_scanner)),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("can\'t launch $url")));
    }
    setState(() {});
  }

  getDistanceInMap(BuildContext context) async {
    print('get Distance in Map called ....');
    getNearestStation();
    String url =
        'https://www.google.com/maps/dir/?api=1&origin=${markers.elementAt(0).position.latitude.toString()},${markers.elementAt(0).position.longitude.toString()}&destination=${markers.elementAt(1).position.latitude.toString()},${markers.elementAt(1).position.longitude.toString()}&travelmode=driving&dir_action=navigate';
    _launchURL(url);
  }

  scanQR() {
    // double distance = Geolocator.distanceBetween(
    //   position.latitude,
    //   position.longitude,
    //   double.parse(nearestStation!.lat!),
    //   double.parse(nearestStation!.long!),
    // );

    // if (distance > 50) {
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //       builder: (context) => ScanQr(stationModel: nearestStation!)));
    // }
  }

  freeTrip() {
    if (userData['freeTrip'] == true) {
      Get.to(() => const FreeTrip());
    }
  }

  void getNearestStation() async {
    print('get nearest station called...');

    getPosition().then((value) {
      nearestStation = stations[0];
      double shortestDistance = double.infinity;

      for (StationModel station in stations) {
        double distance = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          double.parse(station.lat!),
          double.parse(station.long!),
        );

        if (distance < shortestDistance && station.availableBikes != null) {
          shortestDistance = distance;
          nearestStation = station;
        }
        model = nearestStation;
      }

      markers.add(Marker(
        markerId: const MarkerId('1'),
        position: LatLng(double.parse(nearestStation!.lat!),
            double.parse(nearestStation!.long!)),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ));
      drawPolyLine();
      //scanQR();
      setState(() {});
    });
  }

  Future<void> getPosition() async {
    print('get Position is called ......');
    markers.clear();
    position = await _determinePosition();
    googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 10)));
    markers.add(Marker(
      markerId: const MarkerId('currentLocation'),
      position: LatLng(position.latitude, position.longitude),
    ));

    setState(() {});
    print('get position ended ...');
  }

  Future<Position> _determinePosition() async {
    print('determine position is called ....');
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
    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream().listen((pos) {
      position = pos;
    });
    return position;
  }

  void drawPolyLine() async {
    print('drawPolyLine is called .....');
    var response = await http.post(Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json?key=$kApiGoogle&units=metric&origin=${markers.elementAt(0).position.latitude.toString()},${markers.elementAt(0).position.longitude.toString()}&destination=${markers.elementAt(1).position.latitude.toString()},${markers.elementAt(1).position.longitude.toString()}&mode=driving'));

    polylineResponse = PolylineResponse.fromJson(jsonDecode(response.body));

    for (int i = 0;
        i < polylineResponse.routes![0].legs![0].steps!.length;
        i++) {
      polylinePoints.add(Polyline(
          polylineId: PolylineId(
              polylineResponse.routes![0].legs![0].steps![i].polyline!.points!),
          points: [
            LatLng(
                polylineResponse
                    .routes![0].legs![0].steps![i].startLocation!.lat!,
                polylineResponse
                    .routes![0].legs![0].steps![i].startLocation!.lng!),
            LatLng(
                polylineResponse
                    .routes![0].legs![0].steps![i].endLocation!.lat!,
                polylineResponse
                    .routes![0].legs![0].steps![i].endLocation!.lng!),
          ],
          width: 3,
          color: Colors.red));
    }

    setState(() {});
  }
}
