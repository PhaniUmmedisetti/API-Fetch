import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:product/models/user_model_list.dart';

class DataController extends GetxController {
  // ignore: non_constant_identifier_names
  UserModelList? user_list;

  var isDataLoading = false.obs;
  getUserInformationFromApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('https://dummyapi.io/data/v1/user?limit=10')!,
          headers: {'app-id': '63316d6098221eabe45d385c '});

      if (response.statusCode == 200) {
        ///data successfully
        ///
        var result = jsonDecode(response.body);

        user_list = UserModelList.fromJson(result);
      } else {
        ///error
      }
    } catch (e) {
      print('Error while getting data $e');
    } finally {
      isDataLoading(false);
    }
  }
}
