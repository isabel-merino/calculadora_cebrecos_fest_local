import 'package:flutter/material.dart';
import 'data.dart';
import 'global_variable.dart';
//import 'package:provider/provider.dart';

class ScreenFoods extends StatefulWidget {

  const ScreenFoods({super.key});
  //required this.summ

  @override
  State<ScreenFoods> createState() => _ScreenFoods();
}

class _ScreenFoods extends State<ScreenFoods> {
  //late List<Product> comidas = Provider.preciosComida.comidas;
  late List<Product> comidas = preciosComida.comidas;

  @override
  void initState() {
    super.initState();
    GlobalVariables().summ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 13, 161), //blue
        foregroundColor: Theme.of(context).colorScheme.onPrimary, //white
        title: const Text("BarrApp Cebrecos Fest"),
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
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: comidas.length,
                itemBuilder: (context, index) {
                  final product = comidas[index];
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
                          )
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
              ),
            ),
          ],
        )
      )
    );
  }
}