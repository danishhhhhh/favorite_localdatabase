import 'package:firstapi/model/makeup_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MakeupApi extends GetxController {
  RxList<BelajarApi> belajarApi = <BelajarApi>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
      if (response.statusCode == 200) {
        belajarApi.value = belajarApiFromJson(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print("error: ${e.toString}");
    }
  }
}
