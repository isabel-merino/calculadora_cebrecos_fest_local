import 'package:calculadora_cebrecos_fest_local/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_cebrecos_fest_local/screen_navigation_bar.dart';
import 'package:calculadora_cebrecos_fest_local/screen_login.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ScreenSignUp extends StatefulWidget{

  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}


class _ScreenSignUpState extends State<ScreenSignUp> {

  final FirebaseAuthServices _auth = FirebaseAuthServices();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
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

  void _signUp() async {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      print("Todos los campos son obligatorios");
      _showSnackBar("Por favor, completa todos los campos");
      return;
    }

    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
        .hasMatch(email)) {
      print("Por favor introduce un email válido");
      _showSnackBar("Por favor, introduce un email válido");
      return;
    }

    if (password.length < 6) {
      print("La contraseña debe tener al menos 6 caracteres");
      _showSnackBar("La constraseña debe tener como mínimo 6 caracteres");
      return;
    }

    try{
      User? user = await _auth.signUpWithEmailAndPassword(email, password, context);

      if(user != null){
        print("El usuario se ha creado correctamente");
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationWidget()),);
      }
    }
    catch(e) {
      _showSnackBar("Se ha producido un error en las credenciales de acceso");
      print("Error: $e");
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
                'REGÍSTRATE:',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 33, 13, 161)),
              ),
              SizedBox(height: 40),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
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
                    "¿Ya tienes una cuenta?", 
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenLogIn()),);
                    },
                    child: Text(
                      'Accede aquí', 
                      style: TextStyle(color: Colors.teal.shade200),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 38,),
              ElevatedButton(
                onPressed: () {
                  _signUp();
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