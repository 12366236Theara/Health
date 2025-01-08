import 'package:flutter/material.dart';

class Catbuttonsheet extends StatelessWidget {
  const Catbuttonsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode focusnode = FocusNode();

    return GestureDetector(
      onTap: () {
        if (focusnode.hasFocus) {
          focusnode.unfocus();
        }
      },
      child: Container(
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.add,
                size: 30,
              ),
              const Icon(
                Icons.emoji_emotions,
                size: 25,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 1,
                          offset: const Offset(0, 0))
                    ]),
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: "Type", border: InputBorder.none),
                ),
              ),
              const Icon(Icons.send)
            ],
          ),
        ),
      ),
    );
  }
}
