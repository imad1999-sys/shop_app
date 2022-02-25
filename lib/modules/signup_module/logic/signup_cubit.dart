import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/models/signup_model.dart';
import 'package:shop_app/modules/login_module/logic/login_states.dart';
import 'package:shop_app/modules/signup_module/logic/signup_states.dart';
import 'package:shop_app/shared/DIO/dio_helper.dart';
import 'package:shop_app/shared/end_points/end_points.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(SignupInitialState());

  static SignupCubit get(context) => BlocProvider.of(context);

  late SignupModel signupModel;

  signupUser(
      {required String email, required String password, required String name, required String phone}) {
    emit(SignupLoadingState());
    DioHelper.postData(path: Signup, data: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone
    }, query: {}, token: '').then((value){
      signupModel = SignupModel.fromMap(value.data);
      print(signupModel.toString());
      emit(SignupSuccessState(signupModel));

    }).catchError((onError) {
      print(onError.toString());
      emit(SignupFailedState(onError.toString()));
    });
  }
}
