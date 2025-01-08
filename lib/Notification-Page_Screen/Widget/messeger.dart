import 'package:app_kiloit/controller/controller_Get_Notification.dart';
import 'package:app_kiloit/controller/controlller_No_Intenet.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Messeger extends StatefulWidget {
  const Messeger({super.key});

  @override
  State<Messeger> createState() => _MessegerState();
}

class _MessegerState extends State<Messeger> {
    NotificationsController controller = Get.put(NotificationsController());
    NetworkController network = Get.put(NetworkController());


  @override
  Widget build(BuildContext context) {
    

    return Obx(() {
      if (controller.getNotification.isEmpty) {
        return Center(child: Image.asset('lib/image/imageSlider/GroupnotData.png'));
      }
      if(!network.isConnectToInternet.value){
        return Center(child: Icon(Icons.signal_wifi_connected_no_internet_4_outlined , size: 100,),);
        
      } else{
          return ListView.builder(
        itemCount: controller.getNotification.length,
        itemBuilder: (context, index) {
          final date = controller.getNotification[index];
          return Dismissible(
            background: Container(
              color: Colors.red,
              child: const Icon(size: 60, Icons.delete),
            ),
            key: UniqueKey(),
            onDismissed: (direction) {
              if (controller.getNotification.isEmpty) {
                // Only delete the item if there is an internet connection
                controller.deleteApi(controller.getNotification[index].id);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("You deleted data")),
                );
              } else {
                // Cancel dismissal by re-adding the item to the list if offline
                controller.getNotification.insert(index, date);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text("Cannot delete data without internet connection"),
                  ),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 0.1,
                    offset: const Offset(0, 0))
              ]),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                    backgroundImage: NetworkImage(date.thumbnail ?? ''),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          date.name ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 1),
                        Text(
                          date.createdAt ?? '',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          date.viewAt ?? '',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
       );
      }
      
    });
  }
}

