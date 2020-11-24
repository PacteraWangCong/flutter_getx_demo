import 'package:get/get.dart';

class AppController extends GetxController {
  var routeNameObs = ''.obs;

  void routeNameChange(String name) {
    if (routeNameObs.value == name) {
      routeNameObs.refresh();
    } else {
      routeNameObs.value = name;
    }
  }
}
