import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:money_app/common/constants/routes.dart';
import 'package:money_app/common/utils/validator.dart';
import 'package:money_app/common/widgets/password_form_field.dart';
import 'package:money_app/features/sign_in/sign_in_controller.dart';
import 'package:money_app/features/sign_in/sign_in_state.dart';
import 'package:money_app/locator.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_bottom_sheet.dart';
import '../../common/widgets/custom_circular_progress_indicator.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<SignInController>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignInLoadingState) {
        showDialog(
            context: context,
            builder: (context) => CustomCircularProgressIndicator(),
        );
      }

      if (_controller.state is SignInSuccessState) {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("Mael Feioso")
              ,)
            ,)
          ,)
        );
      }

      if (_controller.state is SignInErrorState) {
        final error = _controller.state as SignInErrorState;
        Navigator.pop(context);
        customModalBottomSheet(
          context,
          error.massage,
          "Tentar Novamente"
        );
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 50),
        children: [
          Text(
            "Welcome Back!",
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenLightOTwo,
            ),
          ),
          Image.asset("assets/images/sign_in_image.png", height: 200,),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  textEditingController: _emailController,
                  hintText: "email@email.com",
                  labelText: "your email",
                  textInputType: TextInputType.emailAddress,
                  validator: Validator.validateEmail,
                ),
                PasswordFormField(
                  textEditingController: _passwordController,
                  labelText: "your password",
                  hintText: "********",
                  validator: Validator.validatePassword,
                  helperText: "Pelo menos 8 caracteres, letras maiúsculas, minúsculas, números e símbolos.",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 24, right: 24),
            child: PrimaryButton(
              text: 'Sign In',
              onPressed: () {
                final valid = _formKey.currentState != null && _formKey.currentState!.validate();
                if (valid) {
                  _controller.signIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } else {
                  log("Falha no Login");
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35, left: 70, right: 70),
            child: MultiTextButton(
              onPressed: () => Navigator.popAndPushNamed(context, NamedRoutes.signUp),
              children: [
                Text(
                  "Don’t Have Account? ",
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
                Text(
                  "Sign Up",
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.greenLightOTwo,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}