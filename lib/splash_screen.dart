import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:starbuck_app/home_screen.dart';

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
    Future.delayed(Duration(seconds: 3), (() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: "logo",
            child: Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                  "assets/logo.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
