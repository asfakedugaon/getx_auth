import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_auth_test/view/home_screen.dart';
import 'package:getx_auth_test/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      _checkAuthState();
    });
  }

  void _checkAuthState() async {
    User? user = _auth.currentUser;
    if (user != null) {
      Get.offAll(() => HomeScreen());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("Splash Screen")),
    );
  }
}
