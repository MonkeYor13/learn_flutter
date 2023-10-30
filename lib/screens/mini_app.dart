import 'package:flutter/material.dart';
import 'package:learn_flutter/imports/imports.dart';

class MiniAppScreen extends StatelessWidget {
  const MiniAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini App'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              MyCard(
                cardText: 'Edad Perro',
                image: ('assets/batman.jpg'),
                routeName: MaterialPageRoute(builder: (__) => CardScreen()),
              ),
              SizedBox(height: 10.0,),
              MyCard(
                cardText: 'Contactos',
                image: ('https://th.bing.com/th/id/OIP.iD-DLh5NRStUnPKSUq1IIQHaFf?pid=ImgDet&rs=1'),
                routeName: MaterialPageRoute(builder: (__) => CardScreen()),
              ),
              Image.network('https://th.bing.com/th/id/OIP.iD-DLh5NRStUnPKSUq1IIQHaFf?pid=ImgDet&rs=1'),
            ],
          ),
        ),
      ),
    );
  }
}
