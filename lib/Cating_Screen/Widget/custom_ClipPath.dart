import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class CustomClippath extends StatelessWidget {
  const CustomClippath({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://letsenhance.io/static/03620c83508fc72c6d2b218c7e304ba5/11499/UpscalerAfter.jpg'),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 200,
              child: ClipPath(
                clipper: UpperNipMessageClipper(MessageType.receive),
                child: Container(
                  color: Colors.grey.shade200,
                  padding: const EdgeInsets.all(16),
                  child: const SizedBox(
                    child: Text(
                        overflow: TextOverflow.fade,
                        "Hello Bro__________________What are you Doing Bro"),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 200,
              child: ClipPath(
                clipper: UpperNipMessageClipper(MessageType.send),
                child: Container(
                  color: Colors.grey.shade200,
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                      overflow: TextOverflow.fade,
                      "I  Sleeping.............................................."),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://st2.depositphotos.com/1967477/6350/v/450/depositphotos_63509663-stock-illustration-happy-family-cartoon.jpg'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
