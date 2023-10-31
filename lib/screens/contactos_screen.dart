import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  ContactsScreen({super.key});

  final List<Map<String, String>> favoriteContacts = [
    {'nameContact': 'Pedro', 'phone': '54955555555', 'type': 'Movil'},
    {'nameContact': 'Maria', 'phone': '54955555555', 'type': 'Movil'},
    {'nameContact': 'Rufulin', 'phone': '54955555555', 'type': 'Home'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            CircleAvatar(
              child: Text(
                'CA',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.purple,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text('Phone: +54955555555'),
          ],
        ),
      ),
      body: ListView(
        children: [
          Image.network(
            'https://th.bing.com/th/id/OIP.iD-DLh5NRStUnPKSUq1IIQHaFf?pid=ImgDet&rs=1',
            height: 250.0,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'FAVORITOS',
                  style: TextStyle(fontSize: 15.0, color: Colors.black54),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'AÑADIR',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  textColor: Colors.blue,
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: favoriteContacts.length,
              itemBuilder: (BuildContext context, int index) {
            return Text(favoriteContacts[index]['nameContact']!);
          }
          ),

        ],
      ),
    );
  }
}
