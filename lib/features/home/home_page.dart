import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:money_app/common/constants/app_colors.dart';
import 'package:money_app/common/constants/app_text_styles.dart';
import 'package:money_app/common/extensions/sizes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double get textScaleFactor => MediaQuery.of(context).size.width < 360? 0.7 : 1.0;
  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.greenGradient,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(500, 30),
                  bottomRight: Radius.elliptical(500, 30),
                )
              ),
              height: 287.h,
            )
          ),
          Positioned(
            left: 24,
            right: 24,
            top: 74.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Afternoon,",
                      textScaler: TextScaler.linear(textScaleFactor),
                      style: AppTextStyles.smallText.apply(color: AppColors.white)
                    ),
                    Text(
                      "Francisco Henrique",
                      textScaler: TextScaler.linear(textScaleFactor),
                      style: AppTextStyles.mediumText20.apply(color: AppColors.white)
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 8.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: AppColors.white.withValues(alpha: 0.06)
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional(0.5, -0.5),
                    children: [
                      Icon(
                        Icons.notifications_none_outlined,
                        color: AppColors.white,
                      ),
                      Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: BoxDecoration(
                          color: AppColors.notification,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}