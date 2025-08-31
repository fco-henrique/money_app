import 'package:flutter/material.dart';
import 'package:money_app/common/constants/routes.dart';
import 'package:money_app/features/home/home_page_view.dart';
import 'package:money_app/features/onboarding/onboarding_page.dart';
import 'package:money_app/features/profile/profile_page.dart';
import 'package:money_app/features/sign_in/sign_in_page.dart';
import 'package:money_app/features/sign_up/sign_up_page.dart';
import 'package:money_app/features/splash/splash_page.dart';
import 'package:money_app/features/stats/stats_page.dart';
import 'package:money_app/features/wallet/wallet_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: defaultTheme,
      initialRoute: NamedRoutes.splash,
      routes: {
        NamedRoutes.initial: (context) => OnboardingPage(),
        NamedRoutes.splash: (context) => SplashPage(),
        NamedRoutes.signUp: (context) => SignUpPage(),
        NamedRoutes.signIn: (context) => SignInPage(),
        NamedRoutes.home: (context) => HomePageView(),
        NamedRoutes.profile: (context) => ProfilePage(),
        NamedRoutes.stats: (context) => StatsPage(),
        NamedRoutes.wallet: (context) => WalletPage(),
      },
    );
  }
}
