import 'package:firebase/pages/dashboard.dart';
import 'package:firebase/pages/random.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        title: Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/home.png"),
            TextField(
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
                _loginUser();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loginUser() async {
    String phoneNumber = _phoneNumberController.text;
    String password = _passwordController.text;

    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      // Sign in the user with email and password
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: phoneNumber + "@example.com", // Firebase requires an email
        password: password,
      );

      // Display a success message or navigate to the next screen
      print("Login successful!");

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RandomUserScreen(),
        ),
      );
    } catch (e) {
      // Display an error message
      print("Login failed: $e");
    }
  }
}
