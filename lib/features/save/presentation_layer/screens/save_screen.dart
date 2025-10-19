import 'package:bikestore/core/const/app_colors.dart';
import 'package:bikestore/core/const/app_text.dart';
import 'package:bikestore/features/save/business_logic_layer/save_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SaveScreen extends StatelessWidget {
  SaveScreen({super.key});

  SaveController saveController = Get.put(SaveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
       appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColors.backgroundColor,
        title: AppText.spicyRice('My Saved Items', AppColors.blackColor, 30),
        leading: Icon(Icons.bookmarks_outlined,color: AppColors.blackColor,size: 30,),
      ),
      body: Obx((){
          return saveController.saveList.isEmpty? Center(child: Opacity(
            opacity: 0.6,
            child: Image.asset('assets/images/a/empty.png',width: MediaQuery.of(context).size.width*0.6,fit: BoxFit.fitWidth,)))
          :GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: saveController.saveList.length,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: AppColors.whiteColor
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset(saveController.saveList[index].image,fit: BoxFit.contain,)
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppText.primaryText(saveController.saveList[index].name, AppColors.blackColor, 14),
                          IconButton(onPressed: () {
                            saveController.saveList.removeAt(index);
                          }, icon: Icon(Icons.bookmark_remove_outlined,color:AppColors.redColor))
                        ],
                      )
                    )
                  ],
                ),
              );
            },);
        }
      ),
    );
  }
}