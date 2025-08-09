import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:money_app/features/sign_up/sign_up_state.dart';

class SignUpController extends ChangeNotifier {
  SignUpState _state = SignUpInitialState();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> doSignUp() async {
    _changeState(SignUpLoadingState());
    await Future.delayed(Duration(seconds: 2));

    log("usuário logado");

    _changeState(SignUpSuccessState());
    return true;
  }
}