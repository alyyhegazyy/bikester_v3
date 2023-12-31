import 'package:bikesterr/presentation/components/appbar.dart';
import 'package:bikesterr/presentation/components/drawer.dart';
import 'package:bikesterr/presentation/components/user_info_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import '../../../domain/controllers/user_data_controller.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  //var userDataModel;
  var userDataController = Get.put(UserDataController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        color: const Color.fromRGBO(233, 233, 235, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 80.0,
                  child: Icon(
                    Icons.person,
                    size: 150,
                    color: Colors.greenAccent,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${userDataController.userData.value["userName"]}',
                style: const TextStyle(
                  color: Color.fromRGBO(209, 199, 202, .9),
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: Lottie.asset(
                  'assets/animationOne.json',
                  repeat: true,
                  reverse: false,
                  animate: true,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 340,
                height: 420,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserInfoField(
                      label: "Email:",
                      info: " ${box.read('username')} ",
                    ),
                    UserInfoField(
                      label: "Date of Birth:",
                      info: " ${box.read('dateOfBirth')} ",
                    ),
                    UserInfoField(
                      label: "Phone Number:",
                      info: " ${box.read('phoneNumber')} ",
                    ),
                    UserInfoField(
                      label: "Emergency Number:",
                      info: " ${box.read('emergencyNumber')} ",
                    ),
                    UserInfoField(
                      label: "Blood Group:",
                      info: " ${box.read('bloodGroup')} ",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // Center(
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     style: ButtonStyle(
                    //       backgroundColor: MaterialStateProperty.all(
                    //           const Color.fromRGBO(4, 42, 80, .9)),
                    //       elevation: MaterialStateProperty.all(5),
                    //     ),
                    //     child: const Text('Edit'),
                    //   ),
                    // ),
                  ],
                ),
              ),
              // Container(
              //   child: Lottie.network(
              //       'https://assets4.lottiefiles.com/packages/lf20_sjpoje7f.json',
              //       width: double.infinity,
              //       height: double.infinity,
              //       fit: BoxFit.fill),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
