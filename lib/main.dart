import 'package:flutter/material.dart';
import 'package:learn_flutter/imports/imports.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'one',
      routes: {
        'one': (__) => HomeScreen(),
        'two': (__) => CounterScreen(),
        'three': (__) => MiniAppScreen(),
        'four': (__) => FuncionConArgumento(),
        'five': (__) => ContactsScreen(),
        'six': (__) => ListaEstatica(),
      },
    );
  }
}
