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
          Positioned(
            left: 24.w,
            right: 24.w,
            top: 155.h,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 32.h,
                horizontal: 24.w,
              ),
              decoration: BoxDecoration(
                color: AppColors.darkGreen,
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Balance",
                              textScaler: TextScaler.linear(textScaleFactor),
                              style: AppTextStyles.mediumText16w600.apply(color: AppColors.white),
                            ),
                            Text(
                              "\$ 10,000.00",
                              textScaler: TextScaler.linear(textScaleFactor),
                              style: AppTextStyles.mediumText30.apply(color: AppColors.white),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => log("options"),
                          child: PopupMenuButton(
                            padding:  EdgeInsets.zero,
                            child: const Icon(
                              Icons.more_horiz,
                              color: AppColors.white,
                            ),
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                height: 24,
                                child: Text("Item 1")
                              )
                            ]
                          ),
                        )
                      ],
                  ),
                  SizedBox(height: 36.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.06),
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Icon(
                              Icons.arrow_downward,
                              color: AppColors.white,
                              size: iconSize,
                            ),
                          ),
                          SizedBox(width: 4,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Income",
                                textScaler: TextScaler.linear(textScaleFactor),
                                style: AppTextStyles.mediumText16w500.apply(color: AppColors.white),
                              ),
                              Text(
                                "\$ 2,000.00",
                                textScaler: TextScaler.linear(textScaleFactor),
                                style: AppTextStyles.mediumText20.apply(color: AppColors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.06),
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Icon(
                              Icons.arrow_upward,
                              color: AppColors.white,
                              size: iconSize,
                            ),
                          ),
                          SizedBox(width: 4,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expenses",
                                textScaler: TextScaler.linear(textScaleFactor),
                                style: AppTextStyles.mediumText16w500.apply(color: AppColors.white),
                              ),
                              Text(
                                "\$ 3,000.00",
                                textScaler: TextScaler.linear(textScaleFactor),
                                style: AppTextStyles.mediumText20.apply(color: AppColors.white),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ), 
          ),
          Positioned(
            top: 397.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transaction Histoy",
                        style: AppTextStyles.mediumText18,
                      ),
                      Text(
                        "See all",
                        style: AppTextStyles.inputLabelText,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final color = index % 2 == 0 ? AppColors.income : AppColors.outcome;
                      final value = index % 2 == 0 ? "+ \$ 100.00" : "- \$ 100.00";

                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        leading: Container(
                          decoration: BoxDecoration(
                            color: AppColors.antiFlashWhite,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.monetization_on_outlined
                          ),
                        ),
                        title: Text(
                          "UpWork",
                          style: AppTextStyles.mediumText16w500,
                        ),
                        subtitle: Text(
                          "Today",
                          style: AppTextStyles.smallText13,
                        ),
                        trailing: Text(
                          value,
                          style: AppTextStyles.mediumText18.apply(color: color),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}