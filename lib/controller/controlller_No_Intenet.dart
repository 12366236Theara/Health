import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkController extends GetxController {
  
  var isConnectToInternet = false.obs;  // Ensure the variable name is correct and consistent
  StreamSubscription? streamSubscription;

  @override
  void onInit() {
    streamSubscription = InternetConnection().onStatusChange.listen((event) {
      switch (event) {
        case InternetStatus.connected:
        isConnectToInternet.value = true;
          break;
        case InternetStatus.disconnected: 
          
        default:
          isConnectToInternet.value = false;
          break;
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    streamSubscription?.cancel();
    super.onClose();
  }
}


