//import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:money_app/common/constants/app_colors.dart';
import 'package:money_app/common/constants/app_text_styles.dart';
import 'package:money_app/common/constants/routes.dart';
import 'package:money_app/common/widgets/custom_circular_progress_indicator.dart';
// import 'package:money_app/features/onboarding/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    init();
  }

  Timer init() {
    return Timer(Duration(seconds: 3), navigateToOnboarding);
  }

  void navigateToOnboarding() {
    Navigator.pushReplacementNamed(context, NamedRoutes.initial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.greenGradient,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Money",
                style: AppTextStyles.bigText.copyWith(color: AppColors.white),
              ),
              CustomCircularProgressIndicator()
            ],
          ),
        ),
    );
  }
}
