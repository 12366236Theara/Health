import 'dart:convert';

import 'package:app_kiloit/Model/getDetailApi.dart';
import 'package:app_kiloit/constants/Apii.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeGetDetail extends GetxController {
  var getdetailitem = getDetailitem().obs;
  var isLoding = true.obs;
  void getDetailItemData(int itemid) async {
    try {
      var respose =
          await http.get(Uri.parse('${BASE_URL}api/v1/posts/blog/$itemid'));
      if (respose.statusCode == 200) {
        final khmer = utf8.decode(respose.bodyBytes);
        final detail = jsonDecode(khmer);
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${respose.body}');
        getDetailApi dataApi = getDetailApi.fromJson(detail);
        getdetailitem.value = dataApi.data ?? getDetailitem();
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoding.value = false; 
    }
  }
}
