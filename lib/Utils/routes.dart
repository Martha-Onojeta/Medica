import 'package:flutter/material.dart';
import 'package:medica/Screens/welcome_screen/onboarding_screen.dart';
import 'package:medica/Screens/welcome_screen/splash_screen.dart';

var customRoutes = <String,WidgetBuilder>{
  SplashScreen.route :(context) => SplashScreen(),
  OnboardingScreen.route:(context) => OnboardingScreen()
};