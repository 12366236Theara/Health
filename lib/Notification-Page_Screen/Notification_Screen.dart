import 'package:app_kiloit/Buttom_Navigation/Navigationr.dart';
import 'package:app_kiloit/Notification-Page_Screen/Widget/messeger.dart';
import 'package:app_kiloit/controller/controller_Get_Notification.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
  });
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
  
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationsController controller = Get.put(NotificationsController());
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Navigabaar(),
                  ));
            },
            child: const Icon(
              size: 20,
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "Notification",
            style: TextStyle(color: Colors.white ,fontSize: 20),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    controller.clearAllIndex();
                  });
                },
                child: const Text(
                  "Clear all",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
        body: Messeger());
  }
}
