import 'package:elisabeth_int/app/data/models/poli_models.dart';
import 'package:elisabeth_int/app/data/services/api_service.dart';
import 'package:elisabeth_int/app/routes/app_pages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PoliController extends GetxController {
  RxBool isLoading = true.obs;

  var poliList = <PoliModel>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);

      var data = await ApiService().fetchPoliData();

      poliList.addAll(data);
    } catch (e) {
      Get.snackbar("Network Error", "$e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateData(String kodePoli) async {
    try {
      var baseUrl = '${dotenv.env["BASE_URL_P"]}';
      var header = '${dotenv.env["BASE_HEAD"]}';
      var key = '${dotenv.env["BASE_KEY"]}';

      final url = '$baseUrl/api/$kodePoli';
      final headers = {header: key};

      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        Get.toNamed(Routes.poliUpdate);
      } else {
        Get.snackbar("Error Information", "Data poli tidak dapat ditemukan");
      }
    } catch (e) {
      Get.snackbar("Error Information", "$e");
    }
  }
}
