import 'dart:async';
import 'package:app_kiloit/controller/controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Connetinernet extends GetxController {
  final Connectivity _connectivity = Connectivity();

  final isConnectNet = true.obs;
  var _isdilogOpen = false;
  bool get isConnect => isConnectNet.value;
  late final StreamSubscription _streamsubscription;
  StreamSubscription get streamSubscription => _streamsubscription;
  Connectivity get connectivity => _connectivity;
  bool _isOline = false;
  @override
  void onInit() {
    _checkinternetConnectivity();
    _streamsubscription =
        _connectivity.onConnectivityChanged.listen(_handleConnectionChagne);
  }

  Future<void> _retryConnection() async {
    List<ConnectivityResult> connection =
        await _connectivity.checkConnectivity();
    if (!connection.contains(ConnectivityResult.none)) {
      isConnectNet.value = true;

      Get.back();
    } else {
      Get.snackbar("Online", "Open Oline Please!");
    }
  }

  //checking internet connection Status
  Future<void> _checkinternetConnectivity() async {
    List<ConnectivityResult> connection =
        await _connectivity.checkConnectivity();
  }

  void _handleConnectionChagne(List<ConnectivityResult> connection) {
  
    if (connection.contains(ConnectivityResult.none)) {
      isConnectNet.value = false;
      _isOline = false;
      _showNotificationDinlog();
    } else {
      isConnectNet.value = true;
      _closedilog();
      if (_isOline) {
        Get.snackbar("Oline ", " Oline Back");
      }
    }
  }

  void _showNotificationDinlog() {
    if (_isdilogOpen) return;
    _isdilogOpen = true;
    _isOline = true;
    Get.dialog(
            AlertDialog(
              title: Text("offolin"),
              content: Text("You're Offline . Connneted and ty again"),
              actions: [
                TextButton(
                    onPressed: () {
                      _retryConnection();
                    },
                    child: Text("Connecting"))
              ],
            ),
            barrierDismissible: false)
        .then((_) {
      _isdilogOpen = false;
    });
  }

  void _closedilog() {
    if (_isdilogOpen) {
      Get.back();
      _isdilogOpen = false;
    }
  }

  @override
  void onClose() {
    _streamsubscription.cancel();
    _closedilog();
    super.onClose();
  }
}
