import 'dart:convert';

import 'package:elisabeth_int/app/data/models/booking_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../../../data/services/api_service.dart';

class PasienController extends GetxController {
  RxBool isLoading = true.obs;

  var bookingList = <BookingModel>[].obs;

  var ktpC = "".obs;
  var bpjsC = "".obs;
  var rmC = "".obs;
  var bayarC = "".obs;
  var namaC = "".obs;
  var poliC = "".obs;
  var selesaiC = "".obs;
  var tanggalC = "".obs;
  var bulanC = "".obs;
  var tahunC = "".obs;
  var tempatC = "".obs;
  var lahirC = "".obs;
  var teleponC = "".obs;
  var alamatC = "".obs;
  var kelaminC = "".obs;
  var agamaC = "".obs;
  var ibuC = "".obs;
  var keluargaC = "".obs;
  var statusC = "".obs;
  var sukuC = "".obs;
  var pekerjaanC = "".obs;
  var propinsiC = "".obs;
  var kabupatenC = "".obs;
  var kecamatanC = "".obs;
  var desaC = "".obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  final box = GetStorage();

  Future<bool> checkData() async {
    await GetStorage.init();
    return box.hasData('data');
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);

      var data = await ApiService().fetchBookingData();

      bookingList.addAll(data);
    } catch (e) {
      Get.snackbar("Network Error", "$e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> getDataId(String id) async {
    try {
      isLoading(true);

      var baseUrl = '${dotenv.env["BASE_URL_B"]}';
      var header = '${dotenv.env["BASE_HEAD"]}';
      var key = '${dotenv.env["BASE_KEY"]}';

      final url = '$baseUrl/api/$id';
      final headers = {header: key};

      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        ktpC.value = result['ktp'].toString();
        bpjsC.value = result['bpjs'].toString();
        rmC.value = result['rm'].toString();
        bayarC.value = result['bayar'].toString();
        namaC.value = result['nama'].toString();
        poliC.value = result['poli'].toString();
        tanggalC.value = result['tanggal'].toString();
        bulanC.value = result['bulan'].toString();
        lahirC.value = result['lahir'].toString();
        tempatC.value = result['tempat'].toString();
        teleponC.value = result['telepon'].toString();
        alamatC.value = result['alamat'].toString();
        kelaminC.value = result['kelamin'].toString();
        agamaC.value = result['agama'].toString();
        ibuC.value = result['ibu'].toString();
        keluargaC.value = result['keluarga'].toString();
        sukuC.value = result['suku'].toString();
        pekerjaanC.value = result['pekerjaan'].toString();
        kabupatenC.value = result['kabupaten'].toString();
        kecamatanC.value = result['kecamatan'].toString();
        desaC.value = result['desa'].toString();
      } else {
        Get.snackbar("Error Information", "Data poli tidak dapat ditemukan");
      }
    } catch (e) {
      Get.snackbar("Error Information", "$e");
    } finally {
      isLoading(false);
    }
  }
}
