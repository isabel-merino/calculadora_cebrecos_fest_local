import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  late String name;
  late double price;
  late num count = 0;

  Product(this.name, this.price);

  // void resetCounter(){
  //   count = 0;
  //   notifyListeners();
  // }
}

class preciosBebidas{
  static Product water = Product("Agua", 1.0);
  static Product mosto = Product("Mosto", 1.5);
  static Product wine = Product("Vino", 1.0);
  static Product soda = Product("Refresco", 2.0);
  static Product marianito = Product("Marianito", 1.5);
  static Product vermouth = Product("Vermut", 2.5);
  static Product beer = Product("Caña", 1.5);
  static Product pint = Product("Pinta", 2.5);
  static Product radler = Product("Radler", 2.0);
  static Product kali = Product("Kalimotxo", 2.5);
  static Product drink = Product("Cubata", 5.0);
  static Product bigCupKali = Product("Katxi Kalimocho", 5.0);
  static Product bigCupDrink = Product("Katxi Cubata", 12.0);
  static Product shot = Product("Chupito", 1.5);
  static Product frosty = Product("Granizado", 2.0);

  static List<Product> bebidas = [water, beer, shot, drink, frosty, kali, bigCupDrink, bigCupKali, marianito, mosto, pint, radler, soda, vermouth, wine];
}

class preciosComida{
  static Product crisps = Product("Patatas bolsa", 1.0);
  static Product olives = Product("Aceitunas", 1.0);
  static Product potatoes = Product("Bravas", 3.5);
  static Product chorizo = Product("Chorizo al vino", 3.5);
  static Product hotDogs = Product("Perritos Calientes", 3.5);

  static List<Product> comidas = [olives, potatoes, chorizo, crisps, hotDogs];
}
