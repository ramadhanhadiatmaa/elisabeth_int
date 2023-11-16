import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../data/models/dokter_models.dart';
import '../../../data/services/api_service.dart';
import '../../../routes/app_pages.dart';

class DoctorController extends GetxController {
  RxBool isLoading = true.obs;

  var dokterList = <DokterModel>[].obs;

  final box = GetStorage();

  Future<bool> checkData() async {
    await GetStorage.init();
    return box.hasData('data');
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);

      var data = await ApiService().fetchDokterData();

      dokterList.addAll(data);
    } catch (e) {
      Get.snackbar("Network Error", "$e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteDataId(String kodeDokter) async {
    try {
      var baseUrl = '${dotenv.env["BASE_URL_D"]}';
      var header = '${dotenv.env["BASE_HEAD"]}';
      var key = '${dotenv.env["BASE_KEY"]}';

      final url = '$baseUrl/api/$kodeDokter';
      final headers = {header: key};

      final response = await http.delete(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        Get.snackbar("Success Information", "Berhasil menghapus data");
        Get.offAllNamed(Routes.doctor);
      } else {
        Get.snackbar("Error Information", "Tidak dapat menghapus data");
      }
    } catch (e) {
      Get.snackbar("Error Information", "$e");
    }
  }
}
