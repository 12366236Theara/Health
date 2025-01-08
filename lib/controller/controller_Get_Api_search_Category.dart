import 'dart:async';
import 'dart:convert';

import 'package:app_kiloit/Model/search_Model_Category.dart';
import 'package:app_kiloit/constants/Apii.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ControllerGetApiSearchCategory extends GetxController {
  List<SearchModel> searchCategory = [];
  StreamSubscription? _streamSubscription;
  var isConnectToInternet = false.obs;
  @override
  void onInit() {
    _streamSubscription = InternetConnection().onStatusChange.listen((event) {
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
    getCategorySearch();

    super.onInit();
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }

  void getCategorySearch() async {
    try {
      var response = await http.get(Uri.parse('${BASE_URL}api/v1/categories'));
      if (response.statusCode == 200) {
        final khmer = utf8.decode(response.bodyBytes);
        final category = jsonDecode(khmer);
        print(
            "##############################%%%%%%%%%%%####################${response.body}");
        final searchModel = SearchGetModel.fromJson(category);
        searchCategory = searchModel.data ?? [];
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }
}
