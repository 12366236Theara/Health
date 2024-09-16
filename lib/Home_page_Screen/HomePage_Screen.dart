import 'package:flutter/material.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(
                0xffa6d1f8,
              ),
            ),
            child: const Icon(Icons.person,size: 30,color: Colors.blue,),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.notifications,color: Colors.blue,size: 40,),
          )
        ],
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
