import 'package:flutter/material.dart';

class Iconwidget extends StatelessWidget {
  const Iconwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(height: 0.3,width: 70,color: Colors.blue,),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.link, color: Colors.blue, size: 35)),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.facebook, color: Colors.blue, size: 35)),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  
                  IconButton(onPressed: (){}, icon: const Icon(Icons.telegram, color: Colors.blue, size: 35)),
                  Container(height: 0.3,width: 70,color: Colors.blue,),
                  
                ],
              ),
    );
  }
}