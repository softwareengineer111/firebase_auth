import 'package:firebase/pages/login.dart';
import 'package:firebase/pages/new_bottom.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String? phonenumber = "";

  @override
  void initState() {
    // _phoneNumberController.text =

    // SharedPreferences prefs =
    //     SharedPreferences.getInstance();

    // phonenumber = prefs.getString('phonenumber');

    // _phoneNumberController.text = phonenumber!;

    checkFirstTime();
    super.initState();
  }

  Future checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      phonenumber = prefs.getString('phonenumber');
      _phoneNumberController.text = phonenumber!;
    });
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/otp.png"),
            TextField(
              enabled: false,
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _registerUser();
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    //String phoneNumber = _phoneNumberController.text;

    String phoneNumber = phonenumber!;
    String password = _passwordController.text;

    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      // Create the user with email and password
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: phoneNumber + "@example.com", // Firebase requires an email
        password: password,
      );

      // Send a verification code to the provided phone number
      //await userCredential.user.sendEmailVerification();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavigationScreen(),
        ),
      );
      // Display a success message or navigate to the next screen
      print("Registration successful!");
    } catch (e) {
      // Display an error message
      print("Registration failed: $e");
    }
  }
}
