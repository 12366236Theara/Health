import 'package:app_kiloit/Buttom_Navigation/Navigationr.dart';
import 'package:app_kiloit/controller/contrlller_connetinternet.dart';
import 'package:app_kiloit/controller/controller.dart';
import 'package:app_kiloit/controller/controller_Get_Api_search_Category.dart';
import 'package:app_kiloit/controller/controller_Get_Detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Connetinernet());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Navigabaar(),
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(ControllerGetApiSearchCategory());
    Get.put(HomeGetDetail());
  }
}
