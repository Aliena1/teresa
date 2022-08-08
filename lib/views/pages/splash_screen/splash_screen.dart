import 'package:flutter/material.dart';
import 'package:teresa/controllers/splash_screen_controller/splash_screen_controller.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashScreenController=SplashScreenController();

  @override
  void initState(){
    splashScreenController.check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
    ));
  }
}
