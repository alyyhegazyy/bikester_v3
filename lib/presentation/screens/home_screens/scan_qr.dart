import 'dart:io';
import 'package:bikesterr/data/models/station_model.dart';
import 'package:bikesterr/domain/controllers/trip_controller.dart';
import 'package:bikesterr/presentation/screens/home_screens/end_trip.dart';
import 'package:bikesterr/presentation/screens/home_screens/start_trip.dart';
import 'package:bikesterr/presentation/screens/review.dart';
import 'package:bikesterr/presentation/screens/wallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQr extends StatefulWidget {
  ScanQr({Key? key, this.model, required StationModel stationModel})
      : super(key: key);
  StationModel? model;
  var tripCont = Get.put(TripController());

  @override
  _ScanQrState createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  late MobileScannerController controller = MobileScannerController();
  var tripController = Get.put(TripController());

  Barcode? barcode;
  BarcodeCapture? capture;

  Future<void> onDetect(BarcodeCapture barcode) async {
    capture = barcode;
    bool tripStatus = tripController.tripIsRunning.value;
    setState(() {
      this.barcode = barcode.barcodes.first;
      if (tripStatus == true) {
        tripController.endTrip();
        controller.stop();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EndTrip();
          }));
        });
      } else {
        tripController.startTrip();
        controller.stop();
        //Get.to(StartTrip());
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return StartTrip();
          }));
        });
      }
    });
  }

  MobileScannerArguments? arguments;

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: 200,
      height: 200,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context) {
          return Stack(
            fit: StackFit.expand,
            children: [
              MobileScanner(
                fit: BoxFit.contain,
                scanWindow: scanWindow,
                controller: controller,
                onScannerStarted: (arguments) {
                  setState(() {
                    this.arguments = arguments;
                  });
                },
                onDetect: onDetect,
              ),
              if (barcode != null &&
                  barcode?.corners != null &&
                  arguments != null)
                CustomPaint(
                  painter: BarcodeOverlay(
                    barcode: barcode!,
                    arguments: arguments!,
                    boxFit: BoxFit.contain,
                    capture: capture!,
                  ),
                ),
              CustomPaint(
                painter: ScannerOverlay(scanWindow),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 100,
                  color: Colors.black.withOpacity(0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 120,
                          height: 50,
                          child: FittedBox(
                            child: Text(
                              barcode?.displayValue ?? 'Scan something!',
                              overflow: TextOverflow.fade,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ScannerOverlay extends CustomPainter {
  ScannerOverlay(this.scanWindow);

  final Rect scanWindow;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Rect.largest);
    final cutoutPath = Path()..addRect(scanWindow);

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BarcodeOverlay extends CustomPainter {
  BarcodeOverlay({
    required this.barcode,
    required this.arguments,
    required this.boxFit,
    required this.capture,
  });

  final BarcodeCapture capture;
  final Barcode barcode;
  final MobileScannerArguments arguments;
  final BoxFit boxFit;

  @override
  void paint(Canvas canvas, Size size) {
    if (barcode.corners == null) return;
    final adjustedSize = applyBoxFit(boxFit, arguments.size, size);

    double verticalPadding = size.height - adjustedSize.destination.height;
    double horizontalPadding = size.width - adjustedSize.destination.width;
    if (verticalPadding > 0) {
      verticalPadding = verticalPadding / 2;
    } else {
      verticalPadding = 0;
    }

    if (horizontalPadding > 0) {
      horizontalPadding = horizontalPadding / 2;
    } else {
      horizontalPadding = 0;
    }

    final ratioWidth =
        (Platform.isIOS ? capture.width! : arguments.size.width) /
            adjustedSize.destination.width;
    final ratioHeight =
        (Platform.isIOS ? capture.height! : arguments.size.height) /
            adjustedSize.destination.height;

    final List<Offset> adjustedOffset = [];
    for (final offset in barcode.corners!) {
      adjustedOffset.add(
        Offset(
          offset.dx / ratioWidth + horizontalPadding,
          offset.dy / ratioHeight + verticalPadding,
        ),
      );
    }
    final cutoutPath = Path()..addPolygon(adjustedOffset, true);

    final backgroundPaint = Paint()
      ..color = Colors.red.withOpacity(0.3)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    canvas.drawPath(cutoutPath, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// import 'dart:developer';
// import 'dart:io';
// import 'package:bikesterr/data/models/station_model.dart';
// import 'package:bikesterr/presentation/screens/home_page.dart';
// import 'package:bikesterr/presentation/screens/home_screens/start_trip.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import '../../../constants.dart';
// import 'end_trip.dart';

// class ScanQr extends StatelessWidget {
//   const ScanQr({Key? key, required this.stationModel}) : super(key: key);

//   final StationModel stationModel;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.orange, title: const Text('Scan QR of Bike')),
//       body: Center(
//         child: QRViewExample(
//           stationModel: stationModel,
//         ),
//       ),
//     );
//   }
// }

// class QRViewExample extends StatefulWidget {
//   const QRViewExample({Key? key, required this.stationModel}) : super(key: key);

//   final StationModel stationModel;
//   @override
//   State<StatefulWidget> createState() => _QRViewExampleState();
// }

// class _QRViewExampleState extends State<QRViewExample> {
//   Barcode? result;
//   QRViewController? qrController;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       qrController!.pauseCamera();
//     }
//     qrController!.resumeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: scanQr(),
//       builder: (context, snapshot) => Scaffold(
//         body: Column(
//           children: <Widget>[
//             Expanded(flex: 4, child: _buildQrView(context)),
//             Expanded(
//               flex: 1,
//               child: FittedBox(
//                 fit: BoxFit.contain,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Container(
//                           margin: const EdgeInsets.all(8),
//                           child: ElevatedButton(
//                               style: const ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStatePropertyAll(Colors.orange)),
//                               onPressed: () async {
//                                 await qrController?.toggleFlash();
//                                 setState(() {});
//                               },
//                               child: FutureBuilder(
//                                 future: qrController?.getFlashStatus(),
//                                 builder: (context, snapshot) {
//                                   return Text('Flash: ${snapshot.data}');
//                                 },
//                               )),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.all(8),
//                           child: ElevatedButton(
//                               style: const ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStatePropertyAll(Colors.orange)),
//                               onPressed: () async {
//                                 await qrController?.flipCamera();
//                                 setState(() {});
//                               },
//                               child: FutureBuilder(
//                                 future: qrController?.getCameraInfo(),
//                                 builder: (context, snapshot) {
//                                   if (snapshot.data != null) {
//                                     return Text(
//                                         'Camera facing ${describeEnum(snapshot.data!)}');
//                                   } else {
//                                     return const Text('loading');
//                                   }
//                                 },
//                               )),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future scanQr() async {
//     print('Scan QR code started .....');
//     if (result?.code != null) {
//       print('QR code identified....');
//       await qrController?.stopCamera();
//       print(currentUser!.uid);
//       if (userData['hasActiveRide'] == false) {
//         //startTrip
//         print('start new trip ....');
//         firestore.collection("users").doc(currentUser!.uid).update({
//           'hasActiveRide': true,
//           'activeRideDetails': {
//             'startStation': widget.stationModel.stationName,
//             'startTime': getCurrentTime(),
//           }
//         });
//         await qrController?.stopCamera();

//         Get.off(() =>
//             // StartTrip(
//             //       stationModel: widget.stationModel,
//             //     )
//             HomePage());
//       } else {
//         //endTrip
//         print('end trip....');
//         await firestore.collection("users").doc(currentUser!.uid).update({
//           'hasActiveRide': false,
//           'freeTrip': false,
//           'activeRideDetails': {
//             'startStation': userData['activeRideDetails']['startStation'],
//             'startTime': userData['activeRideDetails']['startTime'],
//             'endStation': widget.stationModel.stationName,
//             'endTime': getCurrentTime(),
//           }
//         });
//         await qrController?.stopCamera();
//         Get.off(() =>
//             //  EndTrip(
//             //       startStation: userData['activeRideDetails']['startStation'],
//             //       endStation: widget.stationModel.stationName.toString(),
//             //       endTime: getCurrentTime().toString(),
//             //       startTime: userData['activeRideDetails']['startTime'],
//             //     )
//             HomePage());
//       } // Get.offAll(() => StartTrip(
//       //       stationModel: widget.stationModel,
//       //     ));
//     }
//   }

//   Widget _buildQrView(BuildContext context) {
//     // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 150.0
//         : 300.0;
//     // To ensure the Scanner view is properly sizes after rotation
//     // we need to listen for Flutter SizeChanged notification and update controller
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//           borderColor: Colors.red,
//           borderRadius: 10,
//           borderLength: 30,
//           borderWidth: 10,
//           cutOutSize: scanArea),
//       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.qrController = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }

//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('no Permission')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     qrController?.dispose();
//     super.dispose();
//   }
// }

// import 'dart:developer';
// import 'dart:io';
// import 'package:bikesterr/data/models/station_model.dart';
// import 'package:bikesterr/presentation/screens/home_page.dart';
// import 'package:bikesterr/presentation/screens/home_screens/start_trip.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import '../../../constants.dart';
// import 'end_trip.dart';

// class ScanQr extends StatelessWidget {
//   const ScanQr({Key? key, required this.stationModel}) : super(key: key);

//   final StationModel stationModel;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.orange, title: const Text('Scan QR of Bike')),
//       body: Center(
//         child: QRViewExample(
//           stationModel: stationModel,
//         ),
//       ),
//     );
//   }
// }

// class QRViewExample extends StatefulWidget {
//   const QRViewExample({Key? key, required this.stationModel}) : super(key: key);

//   final StationModel stationModel;
//   @override
//   State<StatefulWidget> createState() => _QRViewExampleState();
// }

// class _QRViewExampleState extends State<QRViewExample> {
//   Barcode? result;
//   QRViewController? qrController;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//   @override
//   void reassemble() {
//     super.reassemble();
//     // if (Platform.isAndroid) {
//     //   qrController!.pauseCamera();
//     // }
//     qrController!.resumeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: scanQr(),
//       builder: (context, snapshot) => Scaffold(
//         body: Column(
//           children: <Widget>[
//             Expanded(flex: 4, child: _buildQrView(context)),
//             Expanded(
//               flex: 1,
//               child: FittedBox(
//                 fit: BoxFit.contain,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Container(
//                           margin: const EdgeInsets.all(8),
//                           child: ElevatedButton(
//                               style: const ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStatePropertyAll(Colors.orange)),
//                               onPressed: () async {
//                                 await qrController?.toggleFlash();
//                                 setState(() {});
//                               },
//                               child: FutureBuilder(
//                                 future: qrController?.getFlashStatus(),
//                                 builder: (context, snapshot) {
//                                   return Text('Flash: ${snapshot.data}');
//                                 },
//                               )),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.all(8),
//                           child: ElevatedButton(
//                               style: const ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStatePropertyAll(Colors.orange)),
//                               onPressed: () async {
//                                 await qrController?.flipCamera();
//                                 setState(() {});
//                               },
//                               child: FutureBuilder(
//                                 future: qrController?.getCameraInfo(),
//                                 builder: (context, snapshot) {
//                                   if (snapshot.data != null) {
//                                     return Text(
//                                         'Camera facing ${describeEnum(snapshot.data!)}');
//                                   } else {
//                                     return const Text('loading');
//                                   }
//                                 },
//                               )),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future scanQr() async {
//     print('Scan QR code started .....');
//     if (result?.code != null) {
//       print('QR code identified....');
//       await qrController?.stopCamera();
//       print(currentUser!.uid);
//       if (userData['hasActiveRide'] == false) {
//         //startTrip
//         print('start new trip ....');
//         firestore.collection("users").doc(currentUser!.uid).update({
//           'hasActiveRide': true,
//           'activeRideDetails': {
//             'startStation': widget.stationModel.stationName,
//             'startTime': getCurrentTime(),
//           }
//         });
//         await qrController?.stopCamera();

//         Get.off(() =>
//             // StartTrip(
//             //       stationModel: widget.stationModel,
//             //     )
//             HomePage());
//       } else {
//         //endTrip
//         print('end trip....');
//         await firestore.collection("users").doc(currentUser!.uid).update({
//           'hasActiveRide': false,
//           'freeTrip': false,
//           'activeRideDetails': {
//             'startStation': userData['activeRideDetails']['startStation'],
//             'startTime': userData['activeRideDetails']['startTime'],
//             'endStation': widget.stationModel.stationName,
//             'endTime': getCurrentTime(),
//           }
//         });
//         await qrController?.stopCamera();
//         Get.off(() =>
//             //  EndTrip(
//             //       startStation: userData['activeRideDetails']['startStation'],
//             //       endStation: widget.stationModel.stationName.toString(),
//             //       endTime: getCurrentTime().toString(),
//             //       startTime: userData['activeRideDetails']['startTime'],
//             //     )
//             HomePage());
//       } // Get.offAll(() => StartTrip(
//       //       stationModel: widget.stationModel,
//       //     ));
//     }
//   }

//   Widget _buildQrView(BuildContext context) {
//     // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 150.0
//         : 300.0;
//     // To ensure the Scanner view is properly sizes after rotation
//     // we need to listen for Flutter SizeChanged notification and update controller
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//           borderColor: Colors.red,
//           borderRadius: 10,
//           borderLength: 30,
//           borderWidth: 10,
//           cutOutSize: scanArea),
//       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.qrController = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }

//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('no Permission')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     qrController?.dispose();
//     super.dispose();
//   }
// }
