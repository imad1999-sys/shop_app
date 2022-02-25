import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/shop_module/logic/shop_cubit.dart';
import 'package:shop_app/modules/shop_module/logic/shop_states.dart';


class ShopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener: (context , state){},
      builder: (context , state){
        var shopCubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            ],
          ),
          body: shopCubit.pages[shopCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              shopCubit.changeIndex(index);
            },
            currentIndex: shopCubit.currentIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "HOME" ,backgroundColor: Colors.black),
              BottomNavigationBarItem(icon: Icon(Icons.apps),label: "APPS" , backgroundColor: Colors.black),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: "SETTINGS" , backgroundColor: Colors.black),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "FAVORITES" , backgroundColor: Colors.black),
            ],
          ),
        );
      },
    );
  }
}
