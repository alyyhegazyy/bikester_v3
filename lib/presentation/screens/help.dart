import 'package:bikesterr/presentation/components/appbar.dart';
import 'package:bikesterr/presentation/components/drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          // Container(
          //   // width: double.infinity,
          //   // height: double.infinity,
          //   child: Image.asset('lib/assets/bikeMount.avif',
          //       width: double.infinity,
          //       height: double.infinity,
          //       fit: BoxFit.fill),
          // ),
          Container(
            color: Color.fromARGB(204, 255, 255, 255),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Hi Bikester!',
                  style: TextStyle(
                    color: Color.fromRGBO(209, 199, 202, 50),
                    letterSpacing: 2.0,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Lottie.asset(
                  'assets/animationThree.json',
                  repeat: true,
                  reverse: false,
                  animate: true,
                  height: 200,
                  width: 200,
                  //alignment: Alignment.bottomLeft,
                ),
                const SizedBox(
                  height: 0,
                ),
                Center(
                  child: Container(
                    width: 340,
                    height: 440,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              Lottie.asset(
                                'assets/help.json',
                                repeat: true,
                                reverse: false,
                                animate: true,
                                // height: 100,
                                // width: 100,
                                //alignment: Alignment.bottomLeft,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'HOW CAN WE HELP',
                                style: TextStyle(
                                  color: Color.fromRGBO(133, 133, 179, 0.8),
                                  letterSpacing: 2.0,
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Lottie.asset(
                                'assets/help.json',
                                repeat: true,
                                reverse: false,
                                animate: true,
                                // height: 100,
                                // width: 100,
                                //alignment: Alignment.bottomLeft,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Center(
                          child: SizedBox(
                            width: 250,
                            height: 75,
                            child: OutlinedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromRGBO(
                                            209, 199, 202, .8)),
                                    elevation: MaterialStateProperty.all(1),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            side: BorderSide(
                                                color: Colors.red)))),
                                child: const Text(
                                  'FREQUENLTY ASKED QUESTIONS',
                                  style: TextStyle(
                                    color: Color.fromRGBO(233, 233, 235, .8),
                                    letterSpacing: 1.0,
                                    fontSize: 18.0,
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: SizedBox(
                            width: 250,
                            height: 75,
                            child: OutlinedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromRGBO(
                                            209, 199, 202, .8)),
                                    elevation: MaterialStateProperty.all(1),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            side: BorderSide(
                                                color: Colors.red)))),
                                child: const Text(
                                  'CHAT WITH US',
                                  style: TextStyle(
                                    color: Color.fromRGBO(233, 233, 235, .8),
                                    letterSpacing: 1.0,
                                    fontSize: 18.0,
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: SizedBox(
                            width: 250,
                            height: 75,
                            child: OutlinedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromRGBO(
                                            209, 199, 202, .8)),
                                    elevation: MaterialStateProperty.all(1),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            side: BorderSide(
                                                color: Colors.red)))),
                                child: const Text(
                                  'CALL HOTLINE',
                                  style: TextStyle(
                                    color: Color.fromRGBO(233, 233, 235, .8),
                                    letterSpacing: 1.0,
                                    fontSize: 18.0,
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
