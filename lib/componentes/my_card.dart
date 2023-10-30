import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard({
    super.key,
    required this.cardText,
    required this.image,
    required this.routeName,
    this.wight = double.infinity,
    this.height = 275,
    this.isAssets = true,
  });

  final String cardText;
  final double wight;
  final double height;
  final MaterialPageRoute routeName;
  final String image;

  //final ImageProvider image;
  final bool isAssets;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      shadowColor: Colors.amberAccent,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, routeName);
            },
            child: isAssets
                ? Image.asset(
                    image,
                    height: height,
                    width: wight,
                  )
                : Image.network(
                    image,
                    height: height,
                    width: wight,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(cardText),
          ),
        ],
      ),
    );
  }
}
