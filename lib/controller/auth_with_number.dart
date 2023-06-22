import 'dart:developer';

import 'package:firebase/home_page.dart';
import 'package:firebase/pages/dashboard.dart';
import 'package:firebase/pages/otp_page.dart';
import 'package:firebase/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../pages/random.dart';
import 'package:shared_preferences/shared_preferences.dart';

class authWithNumber extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController number = TextEditingController();
  TextEditingController otp = TextEditingController();
  String verifyId = "";
  RxString userMobilerNumber = "".obs;
  final secureStorage = const FlutterSecureStorage();

  late String phonenumber = "";

  User? users = FirebaseAuth.instance.currentUser;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserData();
  }

  void getUserData() {
    // print(users!.displayName);
    // print(users!.phoneNumber);
    // print(users!.email);
    if (users != null) {
      userMobilerNumber.value = users!.phoneNumber.toString();
    }
  }

  void logoutUser() async {
    await auth.signOut();
    getUserData();
  }

  void singUpWithNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('phonenumber', number.text);

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+976${number.text}',
        verificationCompleted: (PhoneAuthCredential credential) {
          print(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          log(e.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
          verifyId = verificationId;
          Get.snackbar(
              "OTP Sended", "Otp sended on your mobiler number ${number.text}");
          Get.to(OTPPage());
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (ex) {
      Get.snackbar("$ex", "");
      print(ex);
    }
  }

  void verifyMobilerNumber() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verifyId,
        smsCode: otp.text,
      );
      await auth.signInWithCredential(credential);
      Get.snackbar("OTP Verifed", "Welcome to Flutter app");

      //const secureStorage = FlutterSecureStorage();

      // await secureStorage.write(
      //     key: "phonenumber", value: number.text as String?);

      // final String? phonenumber =
      //     secureStorage.read(key: "phonenumber") as String?;

      // log("phonenumber");
      // log(phonenumber!);

      //final String? token = await secureStorage.read(key: "token");

      Get.offAll(RegistrationScreen());
    } catch (ex) {
      print(ex);
    }
  }
}
