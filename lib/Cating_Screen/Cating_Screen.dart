import 'package:app_kiloit/Cating_Screen/Widget/CatButtonSheet.dart';
import 'package:app_kiloit/Cating_Screen/Widget/IconWidget.dart';
import 'package:app_kiloit/Cating_Screen/Widget/custom_ClipPath.dart';

import 'package:flutter/material.dart';

class CatingScreen extends StatelessWidget {
  const CatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: Padding(
              padding: const EdgeInsets.all(10),
              child: IconwidgetCat(
                ontap: () {
                  Navigator.of(context).pop();
                },
                icon: Icons.arrow_back_ios,
              )),
          title: const Text(
            "Theara",
            style: TextStyle(fontSize: 19),
          ),
          actions: [
            IconwidgetCat(ontap: () {}, icon: Icons.call),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: IconwidgetCat(ontap: () {}, icon: Icons.videocam),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CustomClippath(),
                CustomClippath(),
                CustomClippath(),
                CustomClippath(),
              ],
            ),
          ),
        ),
        bottomSheet: const Catbuttonsheet(),
      ),
    );
  }
}
