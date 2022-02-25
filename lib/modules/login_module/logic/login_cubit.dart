import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/modules/login_module/logic/login_states.dart';
import 'package:shop_app/shared/DIO/dio_helper.dart';
import 'package:shop_app/shared/end_points/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginiInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  late UserModel userModel;

  loginUser({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(path: Login, data: {
      'email': email,
      'password': password,
    }, query: {}, token: '').then((value) {

      userModel = UserModel.fromMap(value.data);
      print(userModel.data);
      print(userModel.message);
      print(userModel.status);
      emit(LoginSuccessState(userModel));

    }).catchError((onError){

      print(onError.toString());
      emit(LoginFailedState(onError.toString()));

    });
  }
}
