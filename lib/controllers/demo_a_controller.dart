import 'package:get/get.dart';

class DemoAController extends GetxController {
  var count1 = 0.obs;
  var count2 = 0.obs;
  var count3 = 0.obs;

  @override
  void onInit() {
    print('DemoAController A onInit');
    super.onInit();
  }
}
