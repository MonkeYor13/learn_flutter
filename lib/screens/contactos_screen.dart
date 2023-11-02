import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_flutter/model/contact_user.dart';

class ContactsScreen extends StatelessWidget {
  ContactsScreen({super.key});

  final List<ContactUser> favoriteContacts = [
    ContactUser(nameContact: 'Pedro', phone: '54955555555', type: 'Movil'),
    ContactUser(nameContact: 'Maria', phone: '54955555555', type: 'Movil'),
    ContactUser(nameContact: 'Rufilin', phone: '54955555555', type: 'Home'),
    ContactUser(nameContact: 'Cesar', phone: '54955555555', type: 'Movil'),
    ContactUser(nameContact: 'Juan', phone: '54955555555', type: 'Home'),
    ContactUser(nameContact: 'Pepe', phone: '54955555555', type: 'Movil'),
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
          SizedBox(
            height: 180.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                itemCount: favoriteContacts.length,
                itemBuilder: (BuildContext context, int index) {
                  final favoriteContact = favoriteContacts[index];
                  return _FavoriteContact(favoriteContact: favoriteContact);
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'FRECUENTES',
              style: TextStyle(fontSize: 15.0, color: Colors.black54),
            ),
          ),
          ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: favoriteContacts.length,
              itemBuilder: (BuildContext context, int index) {
                final favoriteContact = favoriteContacts[index];
                return ListTile(
                  title: Text(favoriteContact.nameContact),
                  subtitle: Text('${favoriteContact.type} ${favoriteContact.phone}'),
                );
              }),
        ],
      ),
    );
  }
}

class _FavoriteContact extends StatelessWidget {
  const _FavoriteContact({
    required this.favoriteContact,
  });

  final ContactUser favoriteContact;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          //alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              height: 70.0,
              width: 70.0,
              child: CircleAvatar(
                child: Text(
                  favoriteContact.nameContact.substring(0, 1),
                  style: TextStyle(color: Colors.amber, fontSize: 20.0),
                ),
                backgroundColor: Color.fromRGBO(Random().nextInt(255),
                    Random().nextInt(255), Random().nextInt(255), 1),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 3,
              child: MaterialButton(
                onPressed: () {},
                child: Icon(
                  Icons.phone,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                color: Colors.white,
                height: 50.0,
                minWidth: 10.0,
              ),
            ),
          ],
        ),
        Text(
          favoriteContact.nameContact,
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        Text(
          favoriteContact.type,
          style: TextStyle(fontSize: 10.0),
        ),
      ],
    );
  }
}
