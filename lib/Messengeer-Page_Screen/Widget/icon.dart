import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  const IconWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(color: Colors.blue, size: 40, icon);
  }
}