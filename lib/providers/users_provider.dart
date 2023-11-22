import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _UsersJson {
  List art = [];

  Future<List<dynamic>> cargarArchivoJSON() async {
    // Cargar el archivo JSON
    String jsonString = await rootBundle.loadString('data/users.json');

    // Decodificar el JSON en un objeto Dart (por ejemplo, un mapa)
    Map<String, dynamic> data = json.decode(jsonString);

    print(data['users']);
    art = data['users'];
    // Puedes usar 'data' aquí como lo necesites
    return art;
  }
}

final usersJson = _UsersJson();
