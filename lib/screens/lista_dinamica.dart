import 'package:flutter/material.dart';

class ListaDinamica extends StatelessWidget {
  ListaDinamica({super.key});

  final opciones = ['uno', 'dos', 'tres'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Dinamica'),
      ),
      body: ListView(children: _crearItems()),
    );
  }
}

_crearItems() {

  return [];
}
