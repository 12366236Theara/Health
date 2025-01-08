import 'package:app_kiloit/Model/search_Model_Category.dart';
import 'package:app_kiloit/controller/controller_Get_Notification.dart';
import 'package:app_kiloit/controller/controlller_No_Intenet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchCategory extends StatefulWidget {
  final List<SearchModel> searchCategories;

  const SearchCategory({super.key, required this.searchCategories});

  @override
  State<SearchCategory> createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory>
    with TickerProviderStateMixin {
  late TabController controller;
  

  @override
  void initState() {
    super.initState();
    controller =
        TabController(length: widget.searchCategories.length, vsync: this);
  }

  @override
  @override
  Widget build(BuildContext context) {
    NetworkController network = Get.put(NetworkController());
    return Obx((){
     if(!network.isConnectToInternet.value){
        return Center(child: Icon(Icons.signal_wifi_connected_no_internet_4_outlined , size: 100,),);
        
      }
      else{
        return
        TabBar(
      controller: controller,
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(fontSize: 15),
      tabs: List.generate(
        widget.searchCategories.length,
        (index) => Tab(text: widget.searchCategories[index].name ?? ''),
      ).toList(),
    );
      }
    });
  }
}
