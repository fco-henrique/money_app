import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_app/common/constants/app_colors.dart';
import 'package:money_app/common/constants/app_text_styles.dart';

import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipPath(
              clipper: BordaInclinedClipper(),
              child: Container(
                  color: AppColors.iceWhite,
                  //color: Color(0xFFFF00FF),
                  child: Image.asset("assets/images/man.png"),
                )
            ),
          ),
          Text(
            "Spend Smarter",
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenLightOTwo
            )
          ),
          Text(
              "Save More",
              style: AppTextStyles.mediumText.copyWith(
                  color: AppColors.greenLightOTwo
              ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 5),
            child: PrimaryButton(
              text: 'Get Started',
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 66),
            child: MultiTextButton(
              onPressed: () {},
              children: [
                Text(
                  "Already have account? ",
                  style: AppTextStyles.smallText.copyWith(
                      color: AppColors.greyBlack
                  ),
                ),
                Text(
                  "Log in",
                  style: AppTextStyles.smallText.copyWith(
                      color: AppColors.greenLightOTwo
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}

class BordaInclinedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60); // <-- Aumente esse número para maior inclinação
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}