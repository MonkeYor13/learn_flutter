import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

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
        ],
      ),
    );
  }
}
