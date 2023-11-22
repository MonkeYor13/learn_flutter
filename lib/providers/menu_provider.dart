//importamos para que se despliegen las opciones del json
import 'dart:convert';
//importamos el servico
import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List opciones = [];

  _MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    //llamamos los datos del archivo json y los guardamos en una variable
    final resp = await rootBundle.loadString('data/menu_opts.json');

    //importamos el'dart:convert';
    Map dataMap = json.decode(resp);
    print(dataMap['rutas']); //para ver si trae los datos del json
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = _MenuProvider();
