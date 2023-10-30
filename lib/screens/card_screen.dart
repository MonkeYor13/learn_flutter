import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  bool _showCanineAge = false;
  int _dogAge = 0;
  final TextEditingController ageInputController =
      TextEditingController(); // Paso 2: Declara un controlador
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Card Screen'),
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.zero,
            child: FadeInImage(
              placeholder: AssetImage('assets/Infinity.gif'),
              image: AssetImage('assets/batman.jpg'),
              fadeInDuration: Duration(milliseconds: 500),
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: TextField(
              controller: ageInputController,
              maxLength: 3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.group_add,
                  color: Colors.blue,
                ),
                labelText: 'Ingresa su edad',
                helperText: 'Solo numeros',
                suffixIcon: IconButton(
                  onPressed: () {
                    ageInputController.clear();
                    setState(() {});
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          if (_showCanineAge) _showCanineAgeContent(),
          OutlinedButton(
            onPressed: () {
              String canineAge =
                  ageInputController.text; // Paso 4: Obtén el valor ingresado
              if (canineAge.isNotEmpty) {
                FocusScope.of(context).requestFocus(FocusNode());
                _showCanineAge = true;
                _dogAge = int.parse(canineAge) * 7;
                setState(() {});
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Error por favor ingrese edad'),
                  ),
                );
              }
            },
            child: Text('Calcular edad'),
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                  BorderSide(color: Colors.green, width: 2.0)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showCanineAgeContent() {
    return Text('Tu edad canina es $_dogAge años');
  }
}
