import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:money_app/common/constants/app_colors.dart';
import 'package:money_app/common/constants/app_text_styles.dart';
import 'package:money_app/common/constants/routes.dart';
import 'package:money_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:money_app/features/splash/splash_controller.dart';
import 'package:money_app/features/splash/splash_state.dart';
import 'package:money_app/locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();

  @override
  void initState() {
    super.initState();
    _splashController.isUserLogged();
    _splashController.addListener(() {
      if (_splashController.state is SplashSuccessState) {
        Navigator.pushReplacementNamed(context, NamedRoutes.home);
      } else {
        Navigator.pushReplacementNamed(context, NamedRoutes.initial);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _splashController.dispose();
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
