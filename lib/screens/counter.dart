import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Text('Counter $counter'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              boton('Sumar', Icons.add, Colors.green, counter, incrementar),
              boton('Restar', Icons.remove, Colors.red, counter, decrementar),
              boton('Reseteo', Icons.exposure_zero, Colors.black, counter,
                  reseteo),
            ],
          ),
        ],
      ),
    );
  }

// creamos las funciones
  void incrementar(int valor) {
    setState(() {
      counter = valor + 1;
    });
  }

  void decrementar(int valor) {
    setState(() {
      counter = valor - 1;
    });
  }

  void reseteo(int valor) {
    setState(() {
      counter = 0;
    });
  }

  //creamos nuestro boton donde pasaremos los argumentos.
  OutlinedButton boton(
    String text,
    IconData icon,
    Color bgButton,
    final int valor,
    final Function(int) functiones,
  ) {
    return OutlinedButton.icon(
      onPressed: () {
        functiones(valor);
      },
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(bgButton)),
    );
  }
}
