import 'package:bikestore/core/const/app_colors.dart';
import 'package:bikestore/core/const/app_text.dart';
import 'package:bikestore/features/cart/business_logic_layer/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
 CartScreen({super.key});

  CartController cartController=Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColors.backgroundColor,
        title: AppText.spicyRice('My Cart', AppColors.blackColor, 30),
        leading: Icon(Icons.shopping_cart_outlined,color: AppColors.blackColor,size: 30,),
      ),
      body: Obx((){
          return cartController.cartList.isEmpty? Center(child: Opacity(
            opacity: 0.6,
            child: Image.asset('assets/images/a/1.png',width: MediaQuery.of(context).size.width,fit: BoxFit.fitWidth,))):
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemCount: cartController.cartList.length,
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: AppColors.whiteColor,
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(cartController.cartList[index].image)
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText.primaryText(cartController.cartList[index].name, AppColors.blackColor, 20),
                          AppText.firstText(cartController.cartList[index].category, Colors.black38, 10),
                          SizedBox(height: 10,),
                          AppText.spicyRice('${cartController.cartList[index].price}  \$', AppColors.firstColor, 20),

                        ],
                      ),
                    ),
                     Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: () {
                            cartController.cartList.removeAt(index);
                            ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(backgroundColor: AppColors.redColor,
  duration: Duration(seconds: 1),
    margin: EdgeInsets.symmetric(
      vertical: 40,
      horizontal: MediaQuery.of(context).size.width * 0.27,
    ),
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(35.0),
    ),
    content: Wrap(
      children: const [
        Center(
          child: Text(
            'Removed Correctly',
          ),
        ),
      ],
    ),
  ),
);
                          }, icon: Icon(Icons.delete)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 10,
                            children: [
                              InkWell(
                                onTap: () {
                                  if(cartController.cartList[index].count!>1)
                                  {
                                    cartController.cartList[index].count=cartController.cartList[index].count!-1;
                                    cartController.cartList.refresh();
                                  }
                                  
                                },
                                child: AppText.pacifico('-', AppColors.yellowColor, 40)),
                              
                              Obx((){
                                  return AppText.pacifico('${cartController.cartList[index].count}', AppColors.firstColor, 30);
                                }
                              ),


                              InkWell(onTap: () {
                                if(cartController.cartList[index].count!<19)
                                  {
                                    cartController.cartList[index].count=cartController.cartList[index].count!+1;
                                    cartController.cartList.refresh();
                                  }
                              },
                                child: AppText.pacifico('+', AppColors.yellowColor, 40))
                            ],
                          )
                        ],
                      ),
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