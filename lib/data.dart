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

}

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
