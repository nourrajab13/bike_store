import 'package:bikestore/core/const/app_colors.dart';
import 'package:bikestore/core/const/app_text.dart';
import 'package:bikestore/features/home/business_logic_layer/home_controller.dart';
import 'package:bikestore/features/cart/business_logic_layer/cart_controller.dart';
import 'package:bikestore/features/home/data_layer/product_class.dart';
import 'package:bikestore/features/save/business_logic_layer/save_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.product});

  Product product;
  HomeController homeController = Get.put(HomeController());
  CartController cartController = Get.put(CartController());
  SaveController saveController = Get.put(SaveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        actions: [IconButton(onPressed: () {
        }, icon: Icon(Icons.notifications))],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(product.image,width: MediaQuery.of(context).size.width,fit: BoxFit.contain,)),
              Expanded(
                flex: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                    color: AppColors.whiteColor,
                    boxShadow: [BoxShadow(blurRadius: 7,color: Colors.black12)]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.primaryText(product.name, AppColors.blackColor, 30),
                      AppText.firstText(product.category, AppColors.blackColor, 16),
                      AppText.firstText('This high-performance bike combines speed, durability, and modern design, making it ideal for any rider. Built with precision engineering, it ensures a smooth and comfortable experience on every road. Its lightweight frame enhances control and balance, even at high speeds. Perfect for both city rides and long-distance adventures, it adapts easily to any terrain.'
                      , Colors.black38, 14),
                      SizedBox(height: 5,),
                      Row(
                        spacing: 20,
                        children: [
                          Expanded(
                            flex: 6,
                            child: AppText.spicyRice('${product.price}  \$', AppColors.firstColor, 30)),
                          
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                if(homeController.count>1)
                                {
                                  homeController.count--;
                                }
                              },
                              child: AppText.pacifico('-', AppColors.yellowColor, 45)),
                          ),

                          Expanded(
                            flex: 1,
                            child: Obx((){
                                return AppText.pacifico('${homeController.count}', AppColors.firstColor, 30);
                              }
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: InkWell(onTap: 
                            () {
                              if(homeController.count<19)
                              {
                                homeController.count++;
                              }
                            },child: AppText.pacifico('+', AppColors.yellowColor, 45)),
                          )
          
                        ],
                      ),
                      Center(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            addToCart();
                            ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(backgroundColor: AppColors.yellowColor,
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
            'Added to the Cart',
          ),
        ),
      ],
    ),
  ),
);
                          },
                          child: Container(
                            height: 60,
                            width: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              color: AppColors.blackColor,
                            ),
                            child: AppText.spicyRice('Buy Now', AppColors.whiteColor, 20),
                          ),
                        ),
                      )
          
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned( right: 20, top: 210,
                  child: InkWell(
                        onTap: () {
                        if (saveController.saveList.contains(product)) {
                          saveController.saveList.remove(product);
                          }
                        else {
                          saveController.saveList.add(product);
                          }
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Obx((){
                          bool isFavorite = saveController.saveList.contains(product);
                            return Container(
                            height: 60, width: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.yellowColor,
                            ),
                            child: Icon(
                                  isFavorite? Icons.bookmark_added:
                                  Icons.bookmark_add_outlined,color: AppColors.blackColor,)
                            );
                          }
                        ),
                      )
                    )
        ],
      ),
    );
  }

  void addToCart() {
     int i = cartController.cartList.indexWhere((element) => element.id==product.id,);
    if(i==-1)
    {
      cartController.cartList.add(Product(id: product.id, category: product.category, image: product.image, name: product.name, price: product.price, isFav: product.isFav,count: homeController.count.value));
      homeController.count.value=1;
    }
    else
    {
      cartController.cartList[i].count=cartController.cartList[i].count! + homeController.count.value;
      homeController.count.value=1;
    }
  }
}
