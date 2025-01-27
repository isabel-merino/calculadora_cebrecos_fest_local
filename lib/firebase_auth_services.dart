import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthServices {

  FirebaseAuth _auth = FirebaseAuth.instance;  

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<User?> signUpWithEmailAndPassword(String email, String password, BuildContext context) async {
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;      
    }  on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _showSnackBar(context, "Este email ya está registrado en la aplicación.");
      } 
      else if (e.code == 'weak-password') {
        _showSnackBar(context, "La contraseña es demasiado débil.");
      } 
      else if (e.code == 'invalid-email') {
        _showSnackBar(context, "El email proporcionado no es válido.");
      } 
      else {
        _showSnackBar(context, "Error desconocido: ${e.message}");
      }
    }
    catch (e){
      _showSnackBar(context, "Error in signUp with email and password: $e");
    }

    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password, BuildContext context) async {
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;      
    }  on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        _showSnackBar(context, "El email proporcionado no es válido.");
      } 
      else {
        _showSnackBar(context, "Error desconocido: ${e.message}");
      }
    }
    catch (e){
      _showSnackBar(context, "Error in logIn with email and password.");
    }

    return null;
  }

}