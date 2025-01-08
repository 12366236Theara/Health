import 'package:app_kiloit/Model/home_Model_Categories.dart';
import 'package:app_kiloit/controller/controlller_No_Intenet.dart';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeTabar extends StatefulWidget {
  final List<CategoriesIpi> item;
  const HomeTabar({super.key, required this.item});

  @override
  State<HomeTabar> createState() => _HomeTabarState();
}

class _HomeTabarState extends State<HomeTabar> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 30, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NetworkController network = Get.put(NetworkController());
    return Obx(() {
      if (!network.isConnectToInternet.value) {
        return Center(
          child: Icon(
            Icons.signal_wifi_connected_no_internet_4_outlined,
            size: 100,
          ),
        );
      } else {
        if (widget.item.isEmpty) {
          return Container();
        }
        return ButtonsTabBar(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          controller: tabController,
          contentCenter: true,
          borderWidth: 0.5,
          borderColor: Colors.white,
          height: 80,
          unselectedBackgroundColor: Colors.white,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          buttonMargin: EdgeInsets.only(left: 17, right: 5),
          tabs: List.generate(
            widget.item.length,
            (index) => customTabBar(
                icon: widget.item[index].icon ?? "",
                label: widget.item[index].name ?? ""),
          ).toList(),
        );
      }
    });
  }
}

Widget customTabBar({required String icon, required String label}) {
  return Tab(
    // height: 56,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Space between icon and text
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Image.network(
                height: 20,
                width: 20,
                icon.isNotEmpty ? icon : "",
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 5),
              Text(
                label,
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
