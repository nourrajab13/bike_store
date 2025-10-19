import 'package:bikestore/core/const/app_colors.dart';
import 'package:bikestore/core/const/app_text.dart';
import 'package:bikestore/features/home/presentation_layer/screens/navigator_bar.dart';
import 'package:bikestore/features/start/presentation_layer/widgets/custom_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(MediaQuery.of(context).size.width,(MediaQuery.of(context).size.height*0.5).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainterbg(),),
                  Positioned(
                  top: 30,
                  left: MediaQuery.of(context).size.width*0.38,
                  child: 
                  Image.asset('assets/images/a/11.png', width: 100 , fit: BoxFit.fitWidth,)),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.2,
                  right:0,
                  child: 
                  Image.asset('assets/images/a/00.png', height: MediaQuery.of(context).size.height*0.4 , fit: BoxFit.fitHeight,)),
                Positioned(
                   top: MediaQuery.of(context).size.height*0.6,
                  child: Column(
                  children: [
                     AppText.spicyRice('NadKO Store', AppColors.whiteColor, 50),
                      AppText.pacifico('for bikes', AppColors.firstColor, 30),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.to(NavigatorBar());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width-30,
                          height: 70,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 30,top: 50),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: AppColors.darkBlackColor,
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(40)),
                            boxShadow: [BoxShadow(blurRadius: 5,color: Colors.black38)]
                          ),
                          child: Row(
                            spacing: 80,
                            children: [
                              Container(
                                height: 50, width: 50,
                                margin: EdgeInsets.only(left: 5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.yellowColor,
                                  boxShadow: [BoxShadow(spreadRadius: 5,blurRadius: 1,color: Colors.black12)]
                                ),
                                child: Icon(Icons.arrow_forward_ios,color: AppColors.whiteColor,),
                              ),
                              AppText.firstText('Explore Now', AppColors.whiteColor, 16)
                            ],
                          ),
                        ),
                      )
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}