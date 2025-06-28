import 'package:flutter/material.dart';
import 'package:money_app/common/widgets/password_form_field.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
              "Spend Smarter",
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText.copyWith(
                  color: AppColors.greenLightOTwo
              )
          ),
          Text(
            "Save More",
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenLightOTwo
            ),
          ),
          Image.asset("assets/images/sign_up_image.png"),
          Form(
            child: Column(
              children: [
                CustomTextFormField(hintText: "name...", labelText: "your name"),
                PasswordFormField(
                  labelText: "choose your password",
                  hintText: "********",
                ),
                PasswordFormField(
                  labelText: "confirm your password",
                  hintText: "********",
                )
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 5),
            child: PrimaryButton(
              text: 'Sign Up',
              onPressed: () {},
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: MultiTextButton(
                onPressed: () {},
                children: [
                  Text(
                    "Already have account? ",
                    style: AppTextStyles.smallText.copyWith(
                        color: AppColors.darkGrey
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