import 'package:shop_app/models/login_model.dart';

abstract class LoginStates{}

class LoginiInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates{
  final UserModel userModel;

  LoginSuccessState(this.userModel);
}

class LoginFailedState extends LoginStates{
  final String failed;

  LoginFailedState(this.failed);
}