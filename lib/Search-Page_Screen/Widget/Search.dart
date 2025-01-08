import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 1,
                offset: const Offset(0, 0))
          ]),
      child: const TextField(
        cursorRadius: Radius.circular(20),
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.mic),
          // filled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          labelText: 'Search',
        ),
      ),
    );
  }
}
