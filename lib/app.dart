import 'package:flutter/material.dart';
import 'package:money_app/features/onboarding/onboarding_page.dart';
import 'package:money_app/features/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingPage(),
    );
  }
}
