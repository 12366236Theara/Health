import 'dart:convert';
import 'dart:core';
import 'package:app_kiloit/Model/getDetailApi.dart';
import 'package:app_kiloit/Model/home_Model_Api.dart';
import 'package:app_kiloit/Model/home_Model_Categories.dart';
import 'package:app_kiloit/Model/home_Model_api_info.dart';
import 'package:app_kiloit/constants/Apii.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HomeController extends GetxController {
  final homeGridItem = <HomeGridItemData>[].obs;
  List<getDetailitem> itemDeatail = [];
  List<String> homeSlide = <String>[].obs;
  RxList<CategoriesIpi> categoryItem = <CategoriesIpi>[].obs;
  var isLoading = true.obs;
  List<CategoriesIpi> fakeCate = [
    CategoriesIpi(icon: "", name: "", id: 0, order: 0),
    CategoriesIpi(icon: "", name: "", id: 0, order: 0)
  ];
  @override
  void onInit() {
    getUHomeGridItem();
    getUrlHomeTab();

    getUrlCategory();
    super.onInit();
  }

  void getUHomeGridItem() async {
    try {
      var response = await http.get(Uri.parse(BASE_URL + get_home_category));
      if (response.statusCode == 200) {
        final bodyByte = utf8.decode(response.bodyBytes);
        final res = json.decode(bodyByte);
        final moodelMap = HomeGridItemModel.fromJson(
          res as Map<String, dynamic>,
        );
        homeGridItem.value = moodelMap.data ?? [];
        moodelMap.data ?? [];
      }
    } catch (e) {
      print(e.toString());
    }
    update();
    return null;
  }

  void getUrlHomeTab() async {
    try {
      var response = await http.get(Uri.parse(BASE_URL + get_home_info));
      if (response.statusCode == 200) {
        final addjson = jsonDecode(response.body);
        print(response.body);
        final modelMap =
            HomeModelApiInfo.fromJson(addjson as Map<String, dynamic>);
        homeSlide.assignAll(modelMap.data.slides); // Update RxList correctly
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  void getUrlCategory() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse(BASE_URL + CATEGORIES));
      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        final category = jsonDecode(responseBody);
        final categorys = CategoriesHomeScreeen.fromJson(category);

        categoryItem.value = categorys.data ?? [];
      }
    } catch (e) {
      print('Error fetching categories: $e');
    } finally {
      isLoading(false);
    }
    update();
  }
}
