import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatter;
  final FormFieldValidator<String>? validator;
  final String? helperText;

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
    this.suffixIcon,
    this.obscureText,
    this.inputFormatter,
    this.validator,
    this.helperText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isHelperTextVisible = true;

  final OutlineInputBorder defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greenLightOTwo,
    ),
  );

  String? _helperText;

  @override
  void initState() {
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      child: TextFormField(
        onChanged: (value) {
          if (value.isEmpty && !_isHelperTextVisible) {
            setState(() {
              _isHelperTextVisible = true;
            });
          } else if (value.isNotEmpty && _isHelperTextVisible) {
            setState(() {
              _isHelperTextVisible = false;
            });
          }
        },
        validator: widget.validator,
        inputFormatters: widget.inputFormatter,
        obscureText: widget.obscureText ?? false,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLength,
        keyboardType: widget.textInputType,
        controller: widget.textEditingController,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          helperText: _helperText ?? " ",
          helperStyle: TextStyle(
            color: _isHelperTextVisible ? AppColors.grey : Colors.transparent,
          ),
          errorMaxLines: 3,
          helperMaxLines: 3,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          hintText: widget.hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText?.toUpperCase(),
          labelStyle: AppTextStyles.inputLabelText.copyWith(
            color: AppColors.grey,
          ),
          border: defaultBorder,
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}