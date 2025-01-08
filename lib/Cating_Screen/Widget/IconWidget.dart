import 'package:flutter/material.dart';

class IconwidgetCat extends StatelessWidget {
  final Function()? ontap;
  final IconData icon;
  const IconwidgetCat({super.key, required this.ontap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Icon(
        icon,
        size: 24,
      ),
    );
  }
}
