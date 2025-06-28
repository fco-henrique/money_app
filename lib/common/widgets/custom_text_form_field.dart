import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsets? padding;
  final String? hintText;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final int? maxLength;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    super.key,
    this.padding,
    this.labelText,
    this.hintText,
    this.textCapitalization,
    this.textEditingController,
    this.textInputType,
    this.maxLength,
    this.textInputAction,
  });

  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greenLightOTwo,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24
      ),
      child: TextFormField(
        textInputAction: textInputAction,
        maxLength: maxLength,
        keyboardType: textInputType,
        controller: textEditingController,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText?.toUpperCase(),
          labelStyle: AppTextStyles.inputLabelText.copyWith(
              color: AppColors.grey
          ),
          border: defaultBorder,
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder.copyWith(
              borderSide: BorderSide(
                  color: Colors.red
              )
          ),
          focusedErrorBorder: defaultBorder.copyWith(
              borderSide: BorderSide(
                  color: Colors.red
              )
          ),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}