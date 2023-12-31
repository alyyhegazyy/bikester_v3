import 'package:bikesterr/presentation/screens/home_page.dart';
import 'package:bikesterr/presentation/screens/login.dart';
import 'package:bikesterr/presentation/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../components/custom_elevated_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    func();
    super.initState();
  }

  func() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await Get.to(() => HomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Stack(children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            child: Lottie.asset('assets/bgAn.json',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(30),
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'Bikester',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: Colors.black,
                    ),
                  ),
                ),
                CustomElevatedButton(
                  color: Colors.orange,
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Login();
                      }));
                    });
                  },
                  textButton: 'LOG IN',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                  color: const Color(0xff616161),
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Register();
                      }));
                    });
                  },
                  textButton: 'SIGN UP',
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
