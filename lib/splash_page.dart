import 'dart:async';

import 'package:chat_box/onboard_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Subtract.png"),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Chatbox",
                style: TextStyle(
                    fontFamily: "Circular",
                    fontStyle: FontStyle.italic,
                    fontSize: 40),
              )
            ],
          ),
        ),
      ),
    );
  }
}
