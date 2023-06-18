import 'package:bikesterr/data/models/trip_info.dart';
import 'package:bikesterr/domain/controllers/trip_controller.dart';
import 'package:bikesterr/presentation/components/appbar.dart';
import 'package:bikesterr/presentation/components/drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  num money = 500;
  var tripController = Get.put(TripController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      drawer: MyDrawer(),
      body: Container(
        color: const Color.fromRGBO(233, 233, 235, 1),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Center(),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 440,
              height: 750,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Lottie.asset(
                      'assets/wallet.json',
                      repeat: true,
                      reverse: false,
                      animate: true,
                      height: 200,
                      width: 200,
                      //alignment: Alignment.bottomLeft,
                    ),
                  ),
                  const Center(
                    child: Text(
                      'ADD MONEY TO MY WALLET',
                      style: TextStyle(
                        color: Color.fromRGBO(50, 50, 76, 0.898),
                        letterSpacing: 2.0,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      width: 250,
                      height: 75,
                      child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(1),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: Colors.red)))),
                          child: const Text(
                            'Credit Card',
                            style: TextStyle(
                              color: Color.fromRGBO(233, 233, 235, .9),
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: 250,
                      height: 75,
                      child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(1),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: Colors.red)))),
                          child: const Text(
                            'Fawry',
                            style: TextStyle(
                              color: Color.fromRGBO(233, 233, 235, .9),
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: 250,
                      height: 75,
                      child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(1),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: Colors.red)))),
                          child: const Text(
                            'Vodafone cash',
                            style: TextStyle(
                              color: Color.fromRGBO(233, 233, 235, .9),
                              letterSpacing: 1.0,
                              fontSize: 18.0,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      'Your available balance $money EGP ',
                      style: const TextStyle(
                        color: Color.fromRGBO(200, 119, 143, 0.898),
                        letterSpacing: 2.0,
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
