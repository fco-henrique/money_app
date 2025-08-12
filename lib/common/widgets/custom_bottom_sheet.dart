import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_app/common/widgets/primary_button.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

Future<void> customModalBottomSheet(BuildContext context, String content, String buttonText) {
  return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(38),
                  topRight: Radius.circular(38)
              )
          ),
          height: 200,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [
              Text(content, style: AppTextStyles.mediumText18.copyWith(
                  color: AppColors.greenLightOTwo
              )),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 32
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: PrimaryButton(
                      text: buttonText,
                      onPressed: () => Navigator.pop(context),
                      gradientColors: AppColors.greenGradient,
                    ),
                  )
              ),
            ],
          ),
        );
      }
  );
}