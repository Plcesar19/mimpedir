import 'package:flutter/material.dart';
import 'tela_login.dart';
import 'restaurante.dart';
import 'tipo.dart';
void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
    );
  }
}
