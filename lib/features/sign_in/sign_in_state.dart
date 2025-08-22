abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInSuccessState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInErrorState extends SignInState {
  final String massage;

  SignInErrorState(this.massage);
}