import 'package:flutter/material.dart';

class FuncionConArgumento extends StatefulWidget {
  @override
  _FuncionConArgumentoState createState() => _FuncionConArgumentoState();
}

class _FuncionConArgumentoState extends State<FuncionConArgumento> {

  int contador = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejemplo de Incremento en Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Contador: $contador"),
            BotonIncremento(
              valorActual: contador,
              funcionIncremento: incrementarContador,
            ),
          ],
        ),
      ),
    );
  }

  // creamos la funcion
  void incrementarContador(int valorActual) {
    setState(() {
      contador = valorActual + 1;
    });
  }
}


//creamos el boton en una clase  aparte
class BotonIncremento extends StatelessWidget {
  final int valorActual;
  final Function(int) funcionIncremento;

  BotonIncremento({required this.valorActual, required this.funcionIncremento});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Llama a la función de incremento cuando se presiona el botón
        funcionIncremento(valorActual);
      },
      child: Text("Incrementar"),
    );
  }
}
