import 'package:flutter/material.dart';
import 'data.dart';
import 'global_variable.dart';
import 'package:flutter/services.dart';
import 'package:calculadora_cebrecos_fest_local/screen_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class ScreenCalculation extends StatefulWidget {

  // late List<Product> bebidas = preciosBebidas.bebidas;
  // late List<Product> comidas = preciosComida.comidas;

  ScreenCalculation({super.key});
  @override
  _ScreenCalculationState createState() => _ScreenCalculationState();
}

class _ScreenCalculationState extends State<ScreenCalculation> {
  late Future<List<Product>> _bebidasFuture;
  late Future<List<Product>> _comidasFuture;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController dineroRecibidoController = TextEditingController();
  String dineroADevolver = '0';

  @override
  void initState() {
    super.initState();
    GlobalVariables().summ;
    _bebidasFuture = preciosBebidas().obtenerBebidas(); 
    _comidasFuture = preciosComida().obtenerComidas(); 
  }

  void _signOut() async {
    await _auth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenLogIn()),);
  }

  void calcularDevolucion() {
    final double? dineroRecibido = double.tryParse(dineroRecibidoController.text);

    if (dineroRecibido != null && dineroRecibido >= GlobalVariables().summ) {
      setState(() {
        dineroADevolver = (dineroRecibido - GlobalVariables().summ).toStringAsFixed(2);
      });
    } else {
      setState(() {
        dineroADevolver = '0';
      });
    }
  }

  void borrarPedido() {
    setState(() {
      GlobalVariables().summ = 0.0;
      dineroRecibidoController.clear();
      dineroADevolver = '0';

      // for (var bebida in widget.bebidas) {
      //   bebida.count = 0;
      // }
      // for (var comida in widget.comidas) {
      //   comida.count = 0;
      // }
    });
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();  // Cierra el teclado cuando se pulsa fuera
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Importe Pedido Section
              const Text(
                'IMPORTE PEDIDO:',
                style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 33, 13, 161), fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${GlobalVariables().summ}',
                    style: const TextStyle(fontSize: 56, color: Colors.pink),
                  ),
                  const Icon(Icons.euro, color: Colors.pink, size: 56),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.pink, thickness: 2),

              // Dinero Recibido Section
              const SizedBox(height: 20),
              const Text(
                'DINERO RECIBIDO:',
                style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 33, 13, 161), fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: dineroRecibidoController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                      ],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: calcularDevolucion,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                    child: const Text(
                      'CALCULAR',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),

              // Dinero a Devolver Section
              const SizedBox(height: 20),
              const Text(
                'DINERO A DEVOLVER:',
                style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 33, 13, 161), fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dineroADevolver,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(width: 8), // Espacio entre el texto y el icono
                    const Icon(Icons.euro_symbol, size: 24),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.pink, thickness: 2),

              // Borrar Pedido Button
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: borrarPedido,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'BORRAR PEDIDO',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




