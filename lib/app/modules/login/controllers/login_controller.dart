import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController userC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  var password = "";

  Future<void> loginApi() async {
    try {
      var baseUrl = '${dotenv.env["BASE_URL_A"]}';
      var header = '${dotenv.env["BASE_HEAD"]}';
      var key = '${dotenv.env["BASE_KEY"]}';

      var user = userC.text;
      var pass = passC.text;

      final url = '$baseUrl/api/$user';
      final headers = {header: key};

      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        password = result["password"].toString();

        if (pass == password) {
          Get.snackbar("Berhasil Login", "Selamat Datang");
          Get.offAndToNamed(Routes.home);
        } else {
          Get.snackbar("Gagal Masuk", "Password yang dimasukkan salah!!");
        }
      } else {
        Get.snackbar("Gagal Masuk", "Username yang dimasukkan salah!!");
      }
    } catch (e) {
      Get.snackbar("Error Information", "Gagal login, $e");
    }
  }
}
