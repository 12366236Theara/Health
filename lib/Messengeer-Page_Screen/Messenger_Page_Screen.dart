import 'package:app_kiloit/Messengeer-Page_Screen/Widget/Messenger.dart';
import 'package:flutter/material.dart';

class MessengerPageScreen extends StatefulWidget {
  const MessengerPageScreen({super.key});

  @override
  State<MessengerPageScreen> createState() => _MessengerPageScreenState();
}

class _MessengerPageScreenState extends State<MessengerPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Icon(
            size: 30,
            color: Colors.blue,
            Icons.account_circle,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 13),
            child: Icon(
              size: 30,
              color: Colors.blue,
              Icons.notifications,
            ),
          ),
        ],
      ),
      body: Messenger(), // Use Messenger as the primary scrollable widget
    );
  }
}