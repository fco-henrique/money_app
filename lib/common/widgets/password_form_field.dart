import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:money_app/common/widgets/custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;

  const PasswordFormField({
    super.key,
    this.textEditingController,
    this.padding,
    this.hintText,
    this.labelText
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: isHidden,
      textEditingController: widget.textEditingController,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      suffixIcon: InkWell(
        borderRadius: BorderRadius.circular(23),
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
        child: Icon(isHidden ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}
