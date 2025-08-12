abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}
class SignUpSuccessState extends SignUpState {}
class SignUpLoadingState extends SignUpState {}
class SignUpErrorState extends SignUpState {
  final String massage;

  SignUpErrorState(this.massage);
}