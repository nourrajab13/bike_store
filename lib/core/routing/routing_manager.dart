import 'package:bikestore/features/cart/presentation_layer/screens/cart_screen.dart';
import 'package:bikestore/features/home/presentation_layer/screens/home_screen.dart';
import 'package:bikestore/features/profile/presentation_layer/screens/profile_screen.dart';
import 'package:bikestore/features/save/presentation_layer/screens/save_screen.dart';
import 'package:bikestore/features/start/presentation_layer/screens/start_screen.dart';
import 'package:flutter/material.dart';

class RoutingManager {
static String startScr='/';
static String homeScr='/home';
static String cartScr='/cart';
static String saveScr='/save';
static String profileScr='/profile';
//static String startScr='/';
//static String startScr='/';
//static String startScr='/';

  static Map <String, WidgetBuilder> routingManager(){
    return {
      startScr:(context)=>StartScreen(),
      homeScr:(context)=>HomeScreen(),
      cartScr:(context)=>CartScreen(),
      saveScr:(context)=>SaveScreen(),
      profileScr:(context)=>ProfileScreen(),
      //startScr:(context)=>StartScreen(),
      //startScr:(context)=>StartScreen(),
      //startScr:(context)=>StartScreen(),
      //startScr:(context)=>StartScreen(),

    };
  }
} 