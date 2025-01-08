// import 'package:app_kiloit/constants/Apii.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class ControllerNotification extends GetxController {
//   @override
//   void onInit() {
//     deleteApi(listeners);
//     super.onInit();
//   }
//   void deleteApi(int id) async {
//     Map<String, String> headers = {
//       "X-User-ID": "669e142544e1c41ced9a737f",
//     };

//     try {
//       var response = await http.delete(
//         Uri.parse("${BASE_URL}api/v1/histories/$id"),
//         headers: headers,
//       );

//       if (response.statusCode == 200) {
//         getNotification.
//         print('Data deleted successfully');
//       } else if (response.statusCode == 404) {
//         print("Error: Item not found (404)");
//       } else {
//         print("Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Exception occurred: ${e.toString()}");
//     }
//   }
// }
