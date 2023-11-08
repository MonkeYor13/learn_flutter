import 'package:flutter/material.dart';

class ListaEstatica extends StatelessWidget {
  const ListaEstatica({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista estatica'),
      ),
      body: Lista_Estatica(),
    );
  }
}



class Lista_Estatica extends StatelessWidget {
  const Lista_Estatica({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('lista estatica'),
        ),
        Divider(),
        ListTile(
          title: Text('lista estatica'),
        ),
        Divider(),
      ],
    );
  }
}
