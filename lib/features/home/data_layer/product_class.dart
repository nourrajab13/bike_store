class Product {
int id;
int? count;
String image;
String name;
String category;
double price;
bool isFav;
Product({required this.id,required this.category, required this.image, required this.name, required this.price, required this.isFav,this.count});
}