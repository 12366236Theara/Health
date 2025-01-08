import 'package:app_kiloit/controller/controller_Get_Detail.dart';
import 'package:flutter/material.dart';

import 'package:app_kiloit/Detail-Page_Screen/Widget/Iconwidget.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DetailPageScreen extends StatefulWidget {
  final int itemid;

  const DetailPageScreen({
    super.key,
    required this.itemid,
  });

  @override
  _DetailPageScreenState createState() => _DetailPageScreenState();
}

class _DetailPageScreenState extends State<DetailPageScreen> {
  final HomeGetDetail controller = Get.put(HomeGetDetail());
  @override
  void initState() {
    controller.getDetailItemData(widget.itemid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Obx(
              () => Text(
                controller.getdetailitem.value.name ?? '',
                style: const TextStyle(fontSize: 17, color: Colors.white),
              ),
            )),
        body: Obx(
          () {
            if (controller.isLoding.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            controller.getdetailitem.value.thumbnail ?? '',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20),
                      
                        Text(
                          controller.getdetailitem.value.name ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          controller.getdetailitem.value.description ?? '',
                          style: TextStyle(),
                        ),
                      
                        HtmlWidget(
                          controller.getdetailitem.value.content ?? "",
                          textStyle: TextStyle(),
                        ),
                      
                        const SizedBox(height: 30),
                      
                        const Text(
                          "Share to Social media",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        const Iconwidget(), // Assuming this is a widget to share on social media],
                      ]),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
