import 'package:bikestore/core/const/app_colors.dart';
import 'package:bikestore/core/const/app_text.dart';
import 'package:bikestore/features/home/business_logic_layer/home_controller.dart';
import 'package:bikestore/features/home/presentation_layer/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

 HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(onPressed: () {
          
        }, icon: Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {
          
        }, icon: Icon(Icons.notifications))],
      ),
      body: Column(
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: AppText.primaryText('Our Store Bikes', AppColors.blackColor, 40)),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemCount: homeController.categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    homeController.index.value=index;
                    homeController.categoriesShow(index);
                  },
                  child: Obx((){
                      return Container(
                        width: 80,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: homeController.index.value==index?
                           Border.all(color: AppColors.firstColor,width: 2)
                           :Border(bottom: BorderSide.none),
                          borderRadius: BorderRadius.circular(23),
                          color: AppColors.whiteColor,
                        ),
                        child: Image.asset(homeController.categories[index],fit: BoxFit.contain,),
                      );
                    }
                  ),
                );
              },),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.4,
            child: Obx((){
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount: homeController.rightNowProducts.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Get.to(ProductDetailScreen(product: homeController.rightNowProducts[index],));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(homeController.rightNowProducts[index].image,
                                height: 200,fit: BoxFit.contain,),
                                AppText.primaryText(homeController.rightNowProducts[index].name, AppColors.blackColor, 25),
                                AppText.firstText(homeController.rightNowProducts[index].category, Colors.black38, 14),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText.spicyRice('${homeController.rightNowProducts[index].price}  \$', AppColors.firstColor, 20),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        
                                      },
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(ProductDetailScreen(product: homeController.rightNowProducts[index]));
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.yellowColor,
                                          ),
                                          child: Icon(Icons.arrow_forward_ios,color: AppColors.whiteColor,),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Obx((){
                                return Positioned(
                                  top: 0, right: 0,
                                  child: IconButton(onPressed: () {
                                    homeController.showIsFav(index);
                                }, icon: Icon(
                                  homeController.rightNowProducts[index].isFav?
                                  Icons.favorite
                                  :Icons.favorite_border,color:
                                  homeController.rightNowProducts[index].isFav?
                                  AppColors.redColor:
                                   AppColors.blackColor,)));
                              }
                            )
                          ],
                        ),
                      ),
                    );
                  },);
              }
            ),
          )
        ],
      ),
    );
  }
  
}