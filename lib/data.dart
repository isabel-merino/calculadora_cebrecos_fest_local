import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product with ChangeNotifier{
  late String name;
  late double price;
  late String imagePath;
  late num count = 0;

  //Product(this.name, this.price, this.imagePath);
  Product({
    required this.name,
    required this.price,
    required this.imagePath,
  });

  //Constructor para crear un objeto desde Firestore
  Product.fromJson(Map<String, Object?> json) : this(
    name: json['name']! as String, 
    price: json['price']! as double, 
    imagePath: json['imagePath']! as String);

  //Conversor del objeto a documento de Firestore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imagePath': imagePath,
    };
  }
}


//const String BEBIDAS_COLLECTION = "Bebidas";

class preciosBebidas{
  final _firestore = FirebaseFirestore.instance;

  //Método para leer los productos de la colección Bebidas
  Future<List<Product>> obtenerBebidas() async {
    try {
      // Obtener los documentos de la colección "Bebidas"
      QuerySnapshot snapshot = await _firestore.collection("Bebidas").get();

      // Convertir los documentos a una lista de productos
      List<Product> bebidas = snapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return bebidas;
    } 
    catch (e) {
      print("Error al obtener las bebidas: $e");
      return [];
    }
  }

  // late final CollectionReference _bebidasRef;

  // preciosBebidas(){
  //   _bebidasRef = _firestore.collection(BEBIDAS_COLLECTION).withConverter<preciosBebidas>(
  //     fromFirestore: (snapshots, _) => Product.fromJson(snapshots.data()!,), toFirestore: toFirestore)
  // }
}

//const String COMIDAS_COLLECTION = "Comidas";

class preciosComida{
  final _firestore = FirebaseFirestore.instance;

  //Método para leer los productos de la colección Cebidas
  Future<List<Product>> obtenerComidas() async {
    try {
      // Obtener los documentos de la colección "Comidas"
      QuerySnapshot snapshot = await _firestore.collection("Comidas").get();

      // Convertir los documentos a una lista de productos
      List<Product> comidas = snapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return comidas;
    } 
    catch (e) {
      print("Error al obtener las comidas: $e");
      return [];
    }
  }
}

// class preciosBebidas{
  
//   static Product water = Product("Agua", 1.0, "assets/img/agua.png");
//   static Product mosto = Product("Mosto", 1.5, "assets/img/mosto.png");
//   static Product wine = Product("Vino", 1.0, "assets/img/vino.png");
//   static Product soda = Product("Refresco", 2.0, "assets/img/refrescos.png");
//   static Product marianito = Product("Marianito", 1.5, "assets/img/marianito.png");
//   static Product vermouth = Product("Vermut", 2.5, "assets/img/vermut.png");
//   static Product beer = Product("Caña", 1.5, "assets/img/canya.png");
//   static Product pint = Product("Pinta", 2.5, "assets/img/pinta.png");
//   static Product radler = Product("Radler", 2.0, "assets/img/radler.png");
//   static Product kali = Product("Kalimotxo", 2.5, "assets/img/kali.png");
//   static Product drink = Product("Cubata", 5.0, "assets/img/cubata.png");
//   static Product bigCupKali = Product("Katxi Kalimocho", 5.0, "assets/img/katxi.png");
//   static Product bigCupDrink = Product("Katxi Cubata", 12.0, "assets/img/katxi.png");
//   static Product shot = Product("Chupito", 1.5, "assets/img/shot.png");
//   static Product frosty = Product("Granizado", 2.0, "assets/img/granizado.png");

//   static List<Product> bebidas = [water, beer, shot, drink, frosty, kali, bigCupDrink, bigCupKali, marianito, mosto, pint, radler, soda, vermouth, wine];
// }

// class preciosComida{
//   static Product crisps = Product("Patatas bolsa", 1.0, "assets/img/chips.png");
//   static Product olives = Product("Aceitunas", 1.0, "assets/img/aceitunas.png");
//   static Product potatoes = Product("Bravas", 3.5, "assets/img/bravas.png");
//   static Product chorizo = Product("Chorizo al vino", 3.5, "assets/img/chorizos.png");
//   static Product hotDogs = Product("Perritos Calientes", 3.5, "assets/img/hotdog.png");

//   static List<Product> comidas = [olives, potatoes, chorizo, crisps, hotDogs];
// }
