abstract class ShopStates{}

class ShopInitialState extends ShopStates{}

class ShopChangeNavBottomState extends ShopStates{}

class ShopFetchLoadingState extends ShopStates{}

class ShopFetchSuccessState extends ShopStates{}

class ShopFetchErrorState extends ShopStates{
  final String error;

  ShopFetchErrorState(this.error);
}