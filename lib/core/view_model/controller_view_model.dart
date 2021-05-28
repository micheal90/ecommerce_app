import 'package:ecommerce_app/View/account_screen.dart';
import 'package:ecommerce_app/View/cart_screen.dart';
import 'package:ecommerce_app/View/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControllerViewModel extends GetxController{
  int _selectedValue=0;
  Widget _currentScreen = HomeScreen();
  get currentScreen=>_currentScreen;
  int get selectedValue=>_selectedValue;
  void changeSelectedValue(index){
    _selectedValue=index;
    switch(index){
      case 0:
        _currentScreen=HomeScreen();
        break;
      case 1:
        _currentScreen=CartScreen();
        break;
      case 2:
        _currentScreen=AccountScreen();
        break;
    }
    update();
  }

}