import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class ListaDesdeJson extends StatefulWidget {
  const ListaDesdeJson({super.key});

  @override
  State<ListaDesdeJson> createState() => _ListaDesdeJsonState();
}

class _ListaDesdeJsonState extends State<ListaDesdeJson> {
  List _items = [];

  Future<void> readJSON() async {
    // Cargar el archivo JSON
    final String reponse = await rootBundle.loadString('data/users.json');

    // Decodificar el JSON en un objeto Dart (por ejemplo, un mapa)
    final data = await json.decode(reponse);

    setState(() {
      _items = data['users'];
      print('numbers de items ${_items.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My DB'),
      ),
      body: Column(
        children: [
          _items.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        key: ValueKey(_items[index]['id']),
                        color: Colors.amber,
                        child: ListTile(
                          leading: Text(_items[index]['id']),
                          title: Text(_items[index]['name']),
                          subtitle: Text(_items[index]['phone']),
                        ),
                      );
                    },
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    readJSON();
                  },
                  child: Center(
                    child: Text('load json'),
                  ),
                ),
        ],
      ),
    );
  }
}
