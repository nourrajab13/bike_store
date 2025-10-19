import 'package:bikestore/features/cart/presentation_layer/screens/cart_screen.dart';
import 'package:bikestore/features/home/presentation_layer/screens/home_screen.dart';
import 'package:bikestore/features/profile/presentation_layer/screens/profile_screen.dart';
import 'package:bikestore/features/save/presentation_layer/screens/save_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NavigatorController extends GetxController{
  RxInt index=0.obs;

 List<Widget>pages=[
  HomeScreen(),
  SaveScreen(),   
  CartScreen(),   
  ProfileScreen(),   

  ];
}