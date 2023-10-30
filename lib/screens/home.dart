import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'two');
              },
              child: Text('Counter App'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'three');
              },
              child: Text('Mini App'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'four');
              },
              child: Text('Funcion como Argumento'),
            ),
          ],
        ),
      ),
    );
  }
}
