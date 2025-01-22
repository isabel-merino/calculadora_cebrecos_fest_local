import 'package:flutter/material.dart';
import 'package:calculadora_cebrecos_fest_local/screen_navigation_bar.dart';

class ScreenSignUp extends StatelessWidget{

  const ScreenSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 13, 161), //blue
        foregroundColor: Theme.of(context).colorScheme.onPrimary, //white
        title: const Text("BarrApp Cebrecos Fest"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();  // Cierra el teclado cuando se pulsa fuera
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'REGÍSTRATE:',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 33, 13, 161)),
              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 38,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNavigationWidget()),);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                child: const Text(
                  'ENTRAR',
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