import 'package:calculadora_cebrecos_fest_local/screen_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'global_variable.dart';

@immutable
class ScreenDrinks extends StatefulWidget {
  const ScreenDrinks({super.key});

  @override
  State<ScreenDrinks> createState() => _ScreenDrinks();
}


class _ScreenDrinks extends State<ScreenDrinks> {

  late Future<List<Product>> _bebidasFuture;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    GlobalVariables().summ;
    _bebidasFuture = preciosBebidas().obtenerBebidas();
  }

  void _signOut() async {
    await _auth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenLogIn()),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 13, 161), //blue
        foregroundColor: Theme.of(context).colorScheme.onPrimary, //white
        title: const Text("BarrApp Cebrecos Fest"),
        actions: [
          IconButton(
            onPressed: (){
              _signOut();
            }, 
            icon: const Icon(Icons.logout, color: Colors.white))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
          // Header with total amount and price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${GlobalVariables().summ}',
                    style: const TextStyle(fontSize: 56, color: Colors.pink),
                  ),
                  const Icon(Icons.euro, color: Colors.pink, size: 56),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: _bebidasFuture, // Future de las bebidas
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator()); // Cargando
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No hay bebidas disponibles."));
                  }

                  List<Product> bebidas = snapshot.data!; // Lista de bebidas obtenida

                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: bebidas.length,
                    itemBuilder: (context, index) {
                      final product = bebidas[index];
                      return Card(
                        color: Colors.tealAccent.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Placeholder for the image
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(product.imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.name,
                              style: const TextStyle(fontSize: 24),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Minus button
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (product.count > 0) {
                                        product.count--;
                                        GlobalVariables().summ -= product.price;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 33, 13, 161),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.remove, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 20), // Space between buttons
                                // Counter text
                                Text(
                                  product.count.toString(),
                                  style: const TextStyle(fontSize: 24),
                                ),
                                const SizedBox(width: 20), // Space between buttons
                                // Plus button
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      product.count++;
                                      GlobalVariables().summ += product.price;
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 33, 13, 161),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.add, color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        )
      )
    );
  }
}