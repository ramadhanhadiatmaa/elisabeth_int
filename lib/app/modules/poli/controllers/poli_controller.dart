import 'dart:convert';

import 'package:elisabeth_int/app/data/models/poli_models.dart';
import 'package:elisabeth_int/app/data/services/api_service.dart';
import 'package:elisabeth_int/app/routes/app_pages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PoliController extends GetxController {
  RxBool isLoading = true.obs;

  var poliList = <PoliModel>[].obs;

  var poli = "".obs;

  var items = <String>[].obs;
  var doctors = <String>[].obs;
  var statC = "".obs;
  var namaC = "".obs;
  var id = "".obs;

  @override
  void onInit() {
    fetchData();
    fetchDropDown();
    fetchDokter();
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

  Future<void> getDataId(String kodePoli) async {
    try {
      isLoading(true);

      var baseUrl = '${dotenv.env["BASE_URL_P"]}';
      var header = '${dotenv.env["BASE_HEAD"]}';
      var key = '${dotenv.env["BASE_KEY"]}';

      final url = '$baseUrl/api/$kodePoli';
      final headers = {header: key};

      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        namaC.value = result['dokter'].toString();
        statC.value = result['status'].toString();
        poli.value = result['nama'].toString();
        id.value = result['kode_poli'].toString();
      } else {
        Get.snackbar("Error Information", "Data poli tidak dapat ditemukan");
      }
    } catch (e) {
      Get.snackbar("Error Information", "$e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateDataId(String kodePoli) async {
    try {
      var baseUrl = '${dotenv.env["BASE_URL_P"]}';
      var header = '${dotenv.env["BASE_HEAD"]}';
      var key = '${dotenv.env["BASE_KEY"]}';

      final url = '$baseUrl/api/$kodePoli';
      final headers = {header: key};

      Map body = {
        'dokter': namaC.value,
        'status': statC.value,
      };

      final response =
          await http.put(Uri.parse(url), body: body, headers: headers);

      if (response.statusCode == 200) {
        Get.snackbar("Success Information", "Berhasil memperbaharui data");
        Get.offAllNamed(Routes.poli);
      } else {
        Get.snackbar("Error Information", "Data poli tidak dapat ditemukan");
      }
    } catch (e) {
      Get.snackbar("Error Information", "$e");
    }
  }

  Future<void> fetchDropDown() async {
    await Future.delayed(const Duration(seconds: 1));
    items.value = ['Buka', 'Tutup'];
  }

  Future<void> fetchDokter() async {
    await Future.delayed(const Duration(seconds: 1));
    doctors.value = [
      'Dr. Zulkarman, Sp.A',
      'Dr. Andri Sunata, Sp.PD',
      'Dr. Aniq Ulthofiah, Sp.PD',
      'Dr. Bobby Kristianto, Sp.M',
      'Dr. Andreas Lukita Halim, Sp.M',
      'Dr. Danny Aguswahyudi, Sp.OG',
      'Dr. Kristephen Mikha',
      'Dr. Marvin Leonard',
      'Dr. Kent Setiawan Jonathan',
      'Dr. Dennis Tandrea Widjaya',
      'Dr. Sienny Lomanjaya'
    ];
  }
}
