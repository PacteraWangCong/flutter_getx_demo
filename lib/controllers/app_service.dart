import 'package:get/get.dart';

class AppService extends GetxService {
  var routeNameObs = ''.obs;

  void routeNameChange(String name) {
    if (routeNameObs.value == name) {
      routeNameObs.refresh();
    } else {
      routeNameObs.value = name;
    }
  }
}
