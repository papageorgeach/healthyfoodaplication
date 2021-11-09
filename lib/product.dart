class Product {
  String? name;
  String? description;
  double? pricePer100g;
  //per 100g
  int? calories;
  int? protein;
  int? carbs;
  int? fat;

  Product(this.name, this.description, this.pricePer100g, this.calories,
      this.protein, this.carbs, this.fat);

  List macros(double quantity) {
    double mealCalories = calories! * quantity;
    double mealProtein = protein! * quantity;
    double mealCarbs = carbs! * quantity;
    double mealFat = fat! * quantity;
    List macros = [mealCalories, mealProtein, mealCarbs, mealFat];
    return macros;
  }

  double calculatePrice(double quantity) {
    double bill;

    bill = pricePer100g! * quantity;
    return bill;
  }
}
