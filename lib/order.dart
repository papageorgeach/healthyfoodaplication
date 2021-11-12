import 'product/product_in_order.dart';

class Order {
  List<ProductInOrder> products;

  Order(this.products);
  void addProduct(ProductInOrder prod) {
    products.add(prod);
  }
}
