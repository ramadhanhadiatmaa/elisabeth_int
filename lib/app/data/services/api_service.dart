import 'package:elisabeth_int/app/data/models/booking_model.dart';
import 'package:elisabeth_int/app/data/models/dokter_models.dart';
import 'package:elisabeth_int/app/data/models/poli_models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<PoliModel>> fetchPoliData() async {
    var baseUrl = '${dotenv.env["BASE_URL_P"]}';
    var header = '${dotenv.env["BASE_HEAD"]}';
    var key = '${dotenv.env["BASE_KEY"]}';

    final url = '$baseUrl/api';
    final headers = {header: key};

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return poliModelFromJson(response.body);
    } else {
      throw Exception("Network Error");
    }
  }

  Future<List<DokterModel>> fetchDokterData() async {
    var baseUrl = '${dotenv.env["BASE_URL_D"]}';
    var header = '${dotenv.env["BASE_HEAD"]}';
    var key = '${dotenv.env["BASE_KEY"]}';

    final url = '$baseUrl/api';
    final headers = {header: key};

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return dokterModelFromJson(response.body);
    }
    {
      throw Exception("Network Error");
    }
  }

  Future<List<BookingModel>> fetchBookingData() async {
    var baseUrl = '${dotenv.env["BASE_URL_B"]}';
    var header = '${dotenv.env["BASE_HEAD"]}';
    var key = '${dotenv.env["BASE_KEY"]}';

    final url = '$baseUrl/api';
    final headers = {header: key};

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return bookingModelFromJson(response.body);
    }
    {
      throw Exception("Network Error");
    }
  }
}
