import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InformationController extends GetxController {
  final box = GetStorage();

  Future<bool> checkData() async {
    await GetStorage.init();
    return box.hasData('data');
  }
}
