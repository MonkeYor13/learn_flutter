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
  final String routeName;
  final String image;
  //final ImageProvider image;
  final bool isAssets;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Column(
          children: [
            FadeInImage(
              placeholder: AssetImage('assets/Infinity.gif'),
              image: isAssets
                  ? AssetImage(image)
                  : NetworkImage(image) as ImageProvider,
              width: wight,
              height: height,
              fit: BoxFit.cover,
            ),
            Text(cardText),
          ],
        ),
      ),
    );
  }
}
