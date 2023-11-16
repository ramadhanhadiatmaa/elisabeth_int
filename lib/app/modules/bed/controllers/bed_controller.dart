import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';

class BedController extends GetxController {
  final TextEditingController markusnicu = TextEditingController();
  final TextEditingController markusvvip = TextEditingController();
  final TextEditingController markusvip = TextEditingController();
  final TextEditingController lukas = TextEditingController();
  final TextEditingController maria = TextEditingController();
  final TextEditingController fransiskus = TextEditingController();
  final TextEditingController matius = TextEditingController();
  final TextEditingController teresia = TextEditingController();
  final TextEditingController teresiatiga = TextEditingController();
  final TextEditingController yosef = TextEditingController();
  final TextEditingController klara = TextEditingController();
  final TextEditingController egidio = TextEditingController();
  final TextEditingController yohanes = TextEditingController();

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
    var baseUrl = '${dotenv.env["BASE_URL_K"]}';
    var header = '${dotenv.env["BASE_HEAD"]}';
    var key = '${dotenv.env["BASE_KEY"]}';

    final url = '$baseUrl/api/1';

    final headers = {header: key};

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        markusnicu.text = result["markusnicu"].toString();
        markusvvip.text = result["markusvvip"].toString();
        markusvip.text = result["markusvip"].toString();
        lukas.text = result['lukas'].toString();
        maria.text = result['maria'].toString();
        fransiskus.text = result['fransiskus'].toString();
        matius.text = result['matius'].toString();
        teresia.text = result['teresia'].toString();
        teresiatiga.text = result["teresiatiga"].toString();
        yosef.text = result['yosef'].toString();
        klara.text = result['klara'].toString();
        egidio.text = result['egidio'].toString();
        yohanes.text = result['yohanes'].toString();
      } else {
        Get.snackbar("Error Information", "${Error()}");
      }
    } catch (e) {
      Get.snackbar("Error Information", "$e");
    }
  }

  Future<void> updateDataId() async {
    try {
      var baseUrl = '${dotenv.env["BASE_URL_K"]}';
      var header = '${dotenv.env["BASE_HEAD"]}';
      var key = '${dotenv.env["BASE_KEY"]}';

      final url = '$baseUrl/api/1';
      final headers = {header: key};

      Map<String, dynamic> body = {
        "markusnicu": markusnicu.text,
        "markusvvip": markusvvip.text,
        "markusvip": markusvip.text,
        "lukas": lukas.text,
        "maria": maria.text,
        "fransiskus": fransiskus.text,
        "matius": matius.text,
        "teresia": teresia.text,
        "teresiatiga": teresiatiga.text,
        "yosef": yosef.text,
        "klara": klara.text,
        "egidio": egidio.text,
        "yohanes": yohanes.text,
      };

      final response =
          await http.put(Uri.parse(url), body: body, headers: headers);

      if (response.statusCode == 200) {
        Get.snackbar("Success Information", "Berhasil memperbaharui data");
        Get.offAllNamed(Routes.bed);
      } else {
        Get.snackbar("${response.statusCode}", "${Error()}");
      }
    } catch (e) {
      Get.snackbar("Error Information", "$e");
    }
  }
}
