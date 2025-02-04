import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  late String name;
  late double price;
  late String imagePath;
  late num count = 0;

  Product(this.name, this.price, this.imagePath);
}

class preciosBebidas{
  static Product water = Product("Agua", 1.0, "assets/img/agua.png");
  static Product mosto = Product("Mosto", 1.5, "assets/img/mosto.png");
  static Product wine = Product("Vino", 1.0, "assets/img/vino.png");
  static Product soda = Product("Refresco", 2.0, "assets/img/refrescos.png");
  static Product marianito = Product("Marianito", 1.5, "assets/img/marianito.png");
  static Product vermouth = Product("Vermut", 2.5, "assets/img/vermut.png");
  static Product beer = Product("Caña", 1.5, "assets/img/canya.png");
  static Product pint = Product("Pinta", 2.5, "assets/img/pinta.png");
  static Product radler = Product("Radler", 2.0, "assets/img/radler.png");
  static Product kali = Product("Kalimotxo", 2.5, "assets/img/kali.png");
  static Product drink = Product("Cubata", 5.0, "assets/img/cubata.png");
  static Product bigCupKali = Product("Katxi Kalimocho", 5.0, "assets/img/katxi.png");
  static Product bigCupDrink = Product("Katxi Cubata", 12.0, "assets/img/katxi.png");
  static Product shot = Product("Chupito", 1.5, "assets/img/shot.png");
  static Product frosty = Product("Granizado", 2.0, "assets/img/granizado.png");

  static List<Product> bebidas = [water, beer, shot, drink, frosty, kali, bigCupDrink, bigCupKali, marianito, mosto, pint, radler, soda, vermouth, wine];
}

class preciosComida{
  static Product crisps = Product("Patatas bolsa", 1.0, "assets/img/chips.png");
  static Product olives = Product("Aceitunas", 1.0, "assets/img/aceitunas.png");
  static Product potatoes = Product("Bravas", 3.5, "assets/img/bravas.png");
  static Product chorizo = Product("Chorizo al vino", 3.5, "assets/img/chorizos.png");
  static Product hotDogs = Product("Perritos Calientes", 3.5, "assets/img/hotdog.png");

  static List<Product> comidas = [olives, potatoes, chorizo, crisps, hotDogs];
}
