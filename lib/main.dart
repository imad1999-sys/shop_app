import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/home_module/screen/home_screen.dart';
import 'package:shop_app/modules/login_module/view/login_module.dart';
import 'package:shop_app/modules/on_board_module/view/on_board_view.dart';
import 'package:shop_app/modules/shop_module/views/shop_view.dart';
import 'package:shop_app/modules/signup_module/view/signup_module.dart';
import 'package:shop_app/shared/DIO/dio_helper.dart';
import 'package:shop_app/shared/shared_prefrences/cache_helper.dart';

import 'modules/shop_module/logic/shop_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String? token = CacheHelper.getData(key: "token");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignupModule(),
      ),
    );
  }
}
