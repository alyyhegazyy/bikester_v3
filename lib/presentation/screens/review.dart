import 'package:bikesterr/presentation/components/appbar.dart';
import 'package:bikesterr/presentation/components/drawer.dart';
import 'package:bikesterr/presentation/screens/help.dart';
import 'package:bikesterr/presentation/screens/home_page.dart';
import 'package:bikesterr/presentation/screens/home_screens/profile.dart';
import 'package:bikesterr/presentation/screens/wallet.dart';
import 'package:bikesterr/presentation/screens/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:path/path.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  var _myColorOne1 = Colors.grey;
  var _myColorTwo1 = Colors.grey;
  var _myColorThree1 = Colors.grey;
  var _myColorFour1 = Colors.grey;
  var _myColorFive1 = Colors.grey;

  var _myColorOne2 = Colors.grey;
  var _myColorTwo2 = Colors.grey;
  var _myColorThree2 = Colors.grey;
  var _myColorFour2 = Colors.grey;
  var _myColorFive2 = Colors.grey;

  var _myColorOne3 = Colors.grey;
  var _myColorTwo3 = Colors.grey;
  var _myColorThree3 = Colors.grey;
  var _myColorFour3 = Colors.grey;
  var _myColorFive3 = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppbar(),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Container(
            width: 440,
            height: 800,
            color: Color.fromARGB(204, 255, 255, 255),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      'WE HOPE YOU ENJOYED YOUR RIDE WITH BIKESTER!',
                      style: TextStyle(
                        color: Color.fromRGBO(209, 199, 202, 50),
                        letterSpacing: 2.0,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Lottie.asset(
                    'assets/rate.json',
                    repeat: true, reverse: false, animate: true,
                    height: 120,
                    width: 200,
                    //alignment: Alignment.bottomLeft,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'Help us make your coming rides even better',
                      style: TextStyle(
                        color: Color.fromRGBO(209, 199, 202, 50),
                        letterSpacing: 2.0,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(233, 233, 235, .95),
                      border: Border.all(width: 2, color: Colors.blueAccent),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'ROUTE SAFETY',
                          style: TextStyle(
                            color: Color.fromRGBO(4, 42, 80, .6),
                            letterSpacing: 1.0,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Container(
                          height: 30,
                          //margin: const EdgeInsets.all(10.0),
                          color: const Color.fromRGBO(233, 233, 235, .8),
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne1 = Colors.orange;
                                  _myColorTwo1 = Colors.grey;
                                  _myColorThree1 = Colors.grey;
                                  _myColorFour1 = Colors.grey;
                                  _myColorFive1 = Colors.grey;
                                }),
                                color: _myColorOne1,
                              ),
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne1 = Colors.orange;
                                  _myColorTwo1 = Colors.orange;
                                  _myColorThree1 = Colors.grey;
                                  _myColorFour1 = Colors.grey;
                                  _myColorFive1 = Colors.grey;
                                }),
                                color: _myColorTwo1,
                              ),
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne1 = Colors.orange;
                                  _myColorTwo1 = Colors.orange;
                                  _myColorThree1 = Colors.orange;
                                  _myColorFour1 = Colors.grey;
                                  _myColorFive1 = Colors.grey;
                                }),
                                color: _myColorThree1,
                              ),
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne1 = Colors.orange;
                                  _myColorTwo1 = Colors.orange;
                                  _myColorThree1 = Colors.orange;
                                  _myColorFour1 = Colors.orange;
                                  _myColorFive1 = Colors.grey;
                                }),
                                color: _myColorFour1,
                              ),
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne1 = Colors.orange;
                                  _myColorTwo1 = Colors.orange;
                                  _myColorThree1 = Colors.orange;
                                  _myColorFour1 = Colors.orange;
                                  _myColorFive1 = Colors.orange;
                                }),
                                color: _myColorFive1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(233, 233, 235, .8),
                      border: Border.all(width: 2, color: Colors.blueAccent),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'BIKE',
                          style: TextStyle(
                            color: Color.fromRGBO(4, 42, 80, .95),
                            letterSpacing: 1.0,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Container(
                          height: 30,
                          //margin: const EdgeInsets.all(10.0),
                          color: const Color.fromRGBO(233, 233, 235, .8),
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne2 = Colors.orange;
                                  _myColorTwo2 = Colors.grey;
                                  _myColorThree2 = Colors.grey;
                                  _myColorFour2 = Colors.grey;
                                  _myColorFive2 = Colors.grey;
                                }),
                                color: _myColorOne2,
                              ),
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne2 = Colors.orange;
                                  _myColorTwo2 = Colors.orange;
                                  _myColorThree2 = Colors.grey;
                                  _myColorFour2 = Colors.grey;
                                  _myColorFive2 = Colors.grey;
                                }),
                                color: _myColorTwo2,
                              ),
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne2 = Colors.orange;
                                  _myColorTwo2 = Colors.orange;
                                  _myColorThree2 = Colors.orange;
                                  _myColorFour2 = Colors.grey;
                                  _myColorFive2 = Colors.grey;
                                }),
                                color: _myColorThree2,
                              ),
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne2 = Colors.orange;
                                  _myColorTwo2 = Colors.orange;
                                  _myColorThree2 = Colors.orange;
                                  _myColorFour2 = Colors.orange;
                                  _myColorFive2 = Colors.grey;
                                }),
                                color: _myColorFour2,
                              ),
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne2 = Colors.orange;
                                  _myColorTwo2 = Colors.orange;
                                  _myColorThree2 = Colors.orange;
                                  _myColorFour2 = Colors.orange;
                                  _myColorFive2 = Colors.orange;
                                }),
                                color: _myColorFive2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(233, 233, 235, .8),
                      border: Border.all(width: 2, color: Colors.blueAccent),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'OVERALL EXPERIENCE',
                          style: TextStyle(
                            color: Color.fromRGBO(4, 42, 80, .95),
                            letterSpacing: 1.0,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Container(
                          height: 30,
                          //margin: const EdgeInsets.all(10.0),
                          color: const Color.fromRGBO(233, 233, 235, .8),
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne3 = Colors.orange;
                                  _myColorTwo3 = Colors.grey;
                                  _myColorThree3 = Colors.grey;
                                  _myColorFour3 = Colors.grey;
                                  _myColorFive3 = Colors.grey;
                                }),
                                color: _myColorOne3,
                              ),
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne3 = Colors.orange;
                                  _myColorTwo3 = Colors.orange;
                                  _myColorThree3 = Colors.grey;
                                  _myColorFour3 = Colors.grey;
                                  _myColorFive3 = Colors.grey;
                                }),
                                color: _myColorTwo3,
                              ),
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne3 = Colors.orange;
                                  _myColorTwo3 = Colors.orange;
                                  _myColorThree3 = Colors.orange;
                                  _myColorFour3 = Colors.grey;
                                  _myColorFive3 = Colors.grey;
                                }),
                                color: _myColorThree3,
                              ),
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne3 = Colors.orange;
                                  _myColorTwo3 = Colors.orange;
                                  _myColorThree3 = Colors.orange;
                                  _myColorFour3 = Colors.orange;
                                  _myColorFive3 = Colors.grey;
                                }),
                                color: _myColorFour3,
                              ),
                              IconButton(
                                icon: const Icon(Icons.star),
                                onPressed: () => setState(() {
                                  _myColorOne3 = Colors.orange;
                                  _myColorTwo3 = Colors.orange;
                                  _myColorThree3 = Colors.orange;
                                  _myColorFour3 = Colors.orange;
                                  _myColorFive3 = Colors.orange;
                                }),
                                color: _myColorFive3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(233, 233, 235, .8),
                      border: Border.all(width: 2, color: Colors.blueAccent),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    width: 500,
                    height: 150,
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      //minLines: 0,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'FeedBack',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FilledButton(
                    style: const ButtonStyle(
                      alignment: Alignment.center,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'REPORT UNSAFE STREET',
                      style: TextStyle(
                        color: Colors.indigo,
                        letterSpacing: 1.0,
                        fontSize: 8.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        }));
                      });
                    },
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(
                        color: Colors.indigo,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
