import 'package:flutter/material.dart';

class IconGroup extends StatelessWidget {
  final String text;
  final String titl;
  final String image;
  const IconGroup({super.key, required this.text, required this.titl, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
            height: 40,
            width: 40,
            // color: Colors.blue,
            image),
         Text(
          text,
          style: TextStyle(fontSize: 10, color: Colors.blue),
        ),
         Text(
          titl,
          style: TextStyle(color: Colors.blue),
        )
      ],
    );
  }
}
