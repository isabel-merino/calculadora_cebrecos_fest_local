import 'package:calculadora_cebrecos_fest_local/firebase_auth_services.dart';
import 'package:calculadora_cebrecos_fest_local/screen_signup.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_cebrecos_fest_local/screen_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScreenLogIn extends StatefulWidget{

  const ScreenLogIn({super.key});

  @override
  State<ScreenLogIn> createState() => _ScreenLogInState();
}

class _ScreenLogInState extends State<ScreenLogIn>{

  final FirebaseAuthServices _auth = FirebaseAuthServices();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }  

  void _logIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      User? user = await _auth.signInWithEmailAndPassword(email, password, context);

      if(user != null){
        print("El usuario se ha identificado correctamente");
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationWidget()),);
      }
    }
    catch(e) {
      print("Se ha producido un error en las credenciales de acceso");
      _showSnackBar("Email i/o contraseña no son válidos");      
    }

  }

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
                'INTRODUCE TUS DATOS:',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 33, 13, 161)),
              ),
              SizedBox(height: 40),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "¿No tienes una cuenta?", 
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenSignUp()),);
                    },
                    child: Text(
                      'Regístrate aquí', 
                      style: TextStyle(color: Colors.teal.shade200),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 38,),
              ElevatedButton(
                onPressed: () {
                  _logIn();
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