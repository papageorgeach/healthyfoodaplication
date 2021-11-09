import '/dish.dart';
import '/product.dart';
import 'shop_widget.dart';

class Shop {
  String name;
  String address;
  String phone;
  List<Product> products;
  //List<Dish> dishes;

  Shop(this.name, this.address, this.phone, this.products);
}