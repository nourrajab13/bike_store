import 'package:bikestore/features/home/data_layer/product_class.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  RxInt count=1.obs;
  

  List<String>categories=[
    'assets/images/a/aa.png',
    'assets/images/a/logo1.png',
    'assets/images/a/logo2.png',
    'assets/images/a/logo3.png',
    'assets/images/a/logo4.png',
    'assets/images/a/logo5.png',
  ];

  RxList<Product>allProducts=<Product>[
    Product(id: 13,category: 'aprilia', image: 'assets/images/aprilia/2.png', name: 'Api Bike', price: 546, isFav: false),


    Product(id: 1,category: 'ducati', image: 'assets/images/ducati/1.png', name: 'Ducati bike', price: 534, isFav: false,),
    Product(id: 2,category: 'ducati', image: 'assets/images/ducati/2.png', name: 'Ducati bike', price: 546, isFav: false, ),
    Product(id: 3,category: 'ducati', image: 'assets/images/ducati/3.png', name: 'Ducati bike', price: 246, isFav: false,),
    Product(id: 4,category: 'ducati', image: 'assets/images/ducati/4.png', name: 'Ducati bike', price: 578, isFav: false,),
    Product(id: 5,category: 'ducati', image: 'assets/images/ducati/5.png', name: 'Ducati bike', price: 245, isFav: false,),

    //_______________________________________________________________________________

    Product(id: 6,category: 'carvelo', image: 'assets/images/carvelo/1.png', name: 'Carvelo Bike', price: 435, isFav: false,),
    Product(id: 7,category: 'carvelo', image: 'assets/images/carvelo/2.png', name: 'Carvelo Bike', price: 122, isFav: false,),
    Product(id: 8,category: 'carvelo', image: 'assets/images/carvelo/3.png', name: 'Carvelo Bike', price: 245, isFav: false,),
    Product(id: 9,category: 'carvelo', image: 'assets/images/carvelo/4.png', name: 'Carvelo Bike', price: 224, isFav: false,),
    Product(id: 10,category: 'carvelo', image: 'assets/images/carvelo/5.png', name: 'Carvelo Bike', price: 244, isFav: false,),
    Product(id: 11,category: 'carvelo', image: 'assets/images/carvelo/6.png', name: 'Carvelo Bike', price: 241, isFav: false,),

    //_______________________________________________________________________________
    
    Product(id: 12,category: 'aprilia', image: 'assets/images/aprilia/1.png', name: 'Api Bike', price: 134, isFav: false,),
    Product(id: 14,category: 'aprilia', image: 'assets/images/aprilia/3.png', name: 'Api Bike', price: 424, isFav: false,),
    Product(id: 15,category: 'aprilia', image: 'assets/images/aprilia/4.png', name: 'Api Bike', price: 356, isFav: false,),
    Product(id: 16,category: 'aprilia', image: 'assets/images/aprilia/5.png', name: 'Api Bike', price: 233, isFav: false,),
    Product(id: 17,category: 'aprilia', image: 'assets/images/aprilia/6.png', name: 'Api Bike', price: 123, isFav: false),
    
    //________________________________________________________________________________

    Product(id:18,category: 'fuji', image: 'assets/images/fuji/1.png', name: 'Fuji Bike', price: 123, isFav: false),
    Product(id:19,category: 'fuji', image: 'assets/images/fuji/2.png', name: 'Fuji Bike', price: 56, isFav: false,),
    Product(id:20,category: 'fuji', image: 'assets/images/fuji/3.png', name: 'Fuji Bike', price: 24, isFav: false,),
    Product(id:21,category: 'fuji', image: 'assets/images/fuji/4.png', name: 'Fuji Bike', price: 12, isFav: false),
    Product(id:22,category: 'fuji', image: 'assets/images/fuji/5.png', name: 'Fuji Bike', price: 65, isFav: false,),
    Product(id:23,category: 'fuji', image: 'assets/images/fuji/6.png', name: 'Fuji Bike', price: 87, isFav: false,),
    Product(id:24,category: 'fuji', image: 'assets/images/fuji/7.png', name: 'Fuji Bike', price: 56, isFav: false,),
    
    //__________________________________________________________________________________

    Product(id:25,category: 'cannondale', image: 'assets/images/cannondale/1.png', name: 'Cann Bike', price: 156, isFav: false,),
    Product(id:26,category: 'cannondale', image: 'assets/images/cannondale/2.png', name: 'Cann Bike', price: 546, isFav: false,),
    Product(id:27,category: 'cannondale', image: 'assets/images/cannondale/3.png', name: 'Cann Bike', price: 23, isFav: false,),
    Product(id:28,category: 'cannondale', image: 'assets/images/cannondale/4.png', name: 'Cann Bike', price: 136, isFav: false),
    Product(id:29,category: 'cannondale', image: 'assets/images/cannondale/5.png', name: 'Cann Bike', price: 246, isFav: false,),
    Product(id:30,category: 'cannondale', image: 'assets/images/cannondale/6.png', name: 'Cann Bike', price: 136, isFav: false,),

    //__________________________________________________________________________________

    Product(id:31,category: 'Local', image: 'assets/images/local/1.png', name: 'Local Bike', price: 156, isFav: false,),
    Product(id:32,category: 'Local', image: 'assets/images/local/2.png', name: 'Local Bike', price: 24, isFav: false,),
    Product(id:33,category: 'Local', image: 'assets/images/local/3.png', name: 'Local Bike', price: 35, isFav: false,),
    Product(id:34,category: 'Local', image: 'assets/images/local/4.png', name: 'Local Bike', price: 125, isFav: false,),
    Product(id:35,category: 'Local', image: 'assets/images/local/5.png', name: 'Local Bike', price: 26, isFav: false,),
    Product(id:36,category: 'Local', image: 'assets/images/local/6.png', name: 'Local Bike', price: 46, isFav: false,),
    Product(id:37,category: 'Local', image: 'assets/images/local/7.png', name: 'Local Bike', price: 87, isFav: false),
    Product(id:38,category: 'Local', image: 'assets/images/local/8.png', name: 'Local Bike', price: 15, isFav: false,),
    Product(id:39,category: 'Local', image: 'assets/images/local/9.png', name: 'Local Bike', price: 86, isFav: false),
    Product(id:40,category: 'Local', image: 'assets/images/local/10.png', name: 'Local Bike', price: 96, isFav: false),

    //__________________________________________________________________________________


  ].obs;

  RxList<Product>rightNowProducts=<Product>[].obs;
  
    @override
  void onInit() {
    super.onInit();
    rightNowProducts.value = allProducts.toList();
  }
  
  
  void categoriesShow(int index) {
      if(index ==1)
    {
      rightNowProducts.value=allProducts.where((pt) => pt.category=='ducati',).toList();
    }
    else if(index ==2)
    {
      rightNowProducts.value=allProducts.where((pt) => pt.category=='cannondale',).toList();
    }
     else if(index ==3)
    {
      rightNowProducts.value=allProducts.where((pt) => pt.category=='aprilia',).toList();
    }
     else if(index ==4)
    {
      rightNowProducts.value=allProducts.where((pt) => pt.category=='carvelo',).toList();
    }
    else if(index ==5)
    {
      rightNowProducts.value=allProducts.where((pt) => pt.category=='fuji',).toList();
    }
    else{
      rightNowProducts.value=allProducts.toList();
    }
  }

   void showIsFav(int index) {
        int i = allProducts.indexWhere((element) => element.id==rightNowProducts[index].id,);
    if(i!=-1)
    {
      allProducts[i].isFav=!allProducts[i].isFav;
      allProducts.refresh();
      rightNowProducts.refresh();
    }
  }

}