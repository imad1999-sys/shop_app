import 'package:shop_app/models/signup_model.dart';

abstract class SignupStates{}

class SignupInitialState extends SignupStates{}

class SignupLoadingState extends SignupStates{}

class SignupSuccessState extends SignupStates{
  final SignupModel signupModel;

  SignupSuccessState(this.signupModel);
}

class SignupFailedState extends SignupStates{
  final String failed;

  SignupFailedState(this.failed);
}