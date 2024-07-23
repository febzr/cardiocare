import 'themes/theme_main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeMain,
      
      home: oi(),
    );
  }
}

class oi extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final comida = <String> [];
    comida.add('ola');
    return Container();
  }
}