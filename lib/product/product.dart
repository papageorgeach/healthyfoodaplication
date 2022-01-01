class Product {
  String name;
  String description;
  double price;
  bool per100;
  bool perpiece;
  //per 100g or per piece
  int calories;
  int protein;
  int carbs;
  int fat;

  Product(this.name, this.description, this.price, this.per100, this.perpiece,
      this.calories, this.protein, this.carbs, this.fat);

  List macros(double quantity) {
    double mealCalories = calories * quantity;
    double mealProtein = protein * quantity;
    double mealCarbs = carbs * quantity;
    double mealFat = fat * quantity;
    List macros = [mealCalories, mealProtein, mealCarbs, mealFat];
    return macros;
  }

  double calculatePrice(int quantity) {
    double bill;

    bill = price * quantity;
    return bill;
  }
}
