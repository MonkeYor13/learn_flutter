import 'package:flutter/material.dart';
import 'package:learn_flutter/providers/menu_provider.dart';

class ListaDinamica extends StatelessWidget {
  ListaDinamica({super.key});

  final opciones = ['uno', 'dos', 'tres', 'four', 'five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Dinamica'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.opciones);
    menuProvider.cargarData().then((opciones) {
      print('_lista');
      print(opciones);
    });

    return ListView(
      children: _listaItems(),
    );
  }

  List<Widget> _listaItems() {
    return [
      ListTile(title: Text('soy una')),
      ListTile(title: Text('soy una')),
      ListTile(title: Text('soy una')),
    ];
  }
}
