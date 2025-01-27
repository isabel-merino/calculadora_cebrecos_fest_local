import 'package:calculadora_cebrecos_fest_local/firebase_options.dart';
import 'package:calculadora_cebrecos_fest_local/screen_login.dart';
import 'package:calculadora_cebrecos_fest_local/screen_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // ChangeNotifierProvider(
    //   create: (_) => Product(name, price)
    // );
    const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //static double summ = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barra Cebrecos Fest',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 33, 13, 161)),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 20),
        )
      ),
      //home: BottomNavigationWidget(),
      home: ScreenLogIn(),
      //home: const AuthGate(),
    );
  }
}
