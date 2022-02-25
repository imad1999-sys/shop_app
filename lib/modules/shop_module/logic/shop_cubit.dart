import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/modules/categories_module/views/categories_screen.dart';
import 'package:shop_app/modules/favorites_module/views/favorites_screen.dart';
import 'package:shop_app/modules/home_module/screen/home_screen.dart';
import 'package:shop_app/modules/products_module/views/products_screen.dart';
import 'package:shop_app/modules/settings_module/views/settings_screen.dart';
import 'package:shop_app/modules/shop_module/logic/shop_states.dart';
import 'package:shop_app/shared/DIO/dio_helper.dart';
import 'package:shop_app/shared/end_points/end_points.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    FavoritesScreen(),
    ProductsScreen(),
    SettingsScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ShopChangeNavBottomState());
  }

  late HomeModel homeModel;

  void getHomeData() {
    emit(ShopFetchLoadingState());
    DioHelper.getData(path: Home, query: null, token: "").then((value) {
      homeModel = HomeModel.fromMap(value.data);
      print(homeModel.toString());
      emit(ShopFetchSuccessState());
    }).catchError((error) => emit(ShopFetchErrorState(error)));
  }
}
