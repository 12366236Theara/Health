import 'dart:convert';

import 'package:app_kiloit/Model/Notification_Model.dart';
import 'package:app_kiloit/constants/Apii.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificationsController extends GetxController {
  List<DataNotificatin> getNotification = <DataNotificatin>[].obs;
  @override
  void onInit() {
    getApController();
    deleteApi(getNotification);

    super.onInit();
  }

  void getApController() async {
    try {
      const url = BASE_URL + Notification;

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-User-ID": "669e142544e1c41ced9a737f",
      };

      var responcse = await http.get(Uri.parse(url), headers: headers);

      if (responcse.statusCode == 200) {
        final khmer = jsonDecode(utf8.decode(responcse.bodyBytes));
        final GetModel model = GetModel.fromJson(khmer);
        getNotification.addAll(model.data ?? []);
      }
    } catch (e) {
      print("NOtification error: $e");
    }
  }

  void deleteApi(id) async {
    Map<String, String> headers = {
      "X-User-ID": "669e142544e1c41ced9a737f",
    };
    getNotification.removeAt(id);
    try {
      final url = "${BASE_URL}api/v1/histories/$id";
      print("--------------------------------------$url");

      var response = await http.delete(
        Uri.parse(url),
        headers: headers,
      );

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        getNotification.clear();
        print('Data deleted successfully');
      }
      print(response.body);
    } catch (e) {
      print("Exception occurred: ${e.toString()}");
    }
  }

  void clearAllIndex() {
    getNotification.clear();
  }
}
