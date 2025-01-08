import 'package:flutter/material.dart';

class Cable extends StatelessWidget {
  final double h;
  final double w;
  const Cable({super.key, required this.h, required this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      color: Colors.blue,
    );
  }
}