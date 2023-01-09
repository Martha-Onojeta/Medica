import 'package:flutter/material.dart';
import 'package:medica/Const/app_color.dart';
import 'package:medica/Screens/welcome_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
   static const String route = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();
    _splash();
  }

  _splash() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {});
   Navigator.pushReplacementNamed(context, OnboardingScreen.route);
   
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        color: AppColor.primaryColor,
        duration: const Duration(milliseconds: 3000),
        child: const Center(
           child:
            Text(
              "Medica",
              style: TextStyle(
                fontSize: 25.0,
                     fontFamily: "Montserrat",
                color: AppColor.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            
        ),
      ),
    );
  }
}