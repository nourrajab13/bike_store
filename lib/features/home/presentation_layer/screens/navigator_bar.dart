import 'package:bikestore/core/const/app_colors.dart';
import 'package:bikestore/features/home/business_logic_layer/navigator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NavigatorBar extends StatelessWidget {
  NavigatorBar({super.key});

  NavigatorController navigatorController = Get.put(NavigatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx((){
          return navigatorController.pages[navigatorController.index.value];
        }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(23),
          child: Obx(
             () {
              return BottomNavigationBar(
                backgroundColor: AppColors.blackColor,
                currentIndex: navigatorController.index.value,
                onTap: (value) {
                  navigatorController.index.value=value;
                },
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedIconTheme: IconThemeData(color: AppColors.whiteColor),
                unselectedIconTheme: IconThemeData(color: AppColors.whiteColor),

                items: [
                  
                  BottomNavigationBarItem(icon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: navigatorController.index.value==0? AppColors.firstColor :AppColors.blackColor
                    ),
                    child: Icon(Icons.home_filled,size: 35,)),label: 'home'),
          
          
                  BottomNavigationBarItem(icon: Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: navigatorController.index.value==1? AppColors.firstColor :AppColors.blackColor
                    ),
                    child: Icon(Icons.bookmark,size: 35,)),label: 'save'),
          
          
                  BottomNavigationBarItem(icon: Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: navigatorController.index.value==2? AppColors.firstColor :AppColors.blackColor
                    ),
                    child: Icon(Icons.shopping_bag_rounded,size: 35,)),label: 'shop'),
                  
                  BottomNavigationBarItem(icon:  Container(
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: navigatorController.index.value==3? AppColors.firstColor :AppColors.blackColor
                    ),
                  child: Icon(Icons.person_2_rounded,size: 35,)),label: 'profile'),
                ]
                );
            }
          ),
        ),
      ),
    );
  }
}