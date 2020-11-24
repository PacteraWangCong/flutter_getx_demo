import 'package:get/get.dart';

class DemoAController extends GetxController {
  var count1 = 0.obs;
  var count2 = 0.obs;
  var count3 = 0.obs;

  @override
  void onInit() {
    /// 每次`count1`变化时调用。
    ever(count1, (value) => print('Worked event coun1 $value'));

    /// 只有在变量$_第一次被改变时才会被调用。
    once(count1, (value) => print("Worked once coun1 $value"));

    /// 防DDos - 每当用户停止输入1秒时调用，例如.
    debounce(count1, (value) => print("Worked debounce coun1 $value"), time: Duration(seconds: 1));

    /// 忽略1秒内的所有变化。。
    interval(count1, (value) => print("Worked interval coun1 $value"), time: Duration(seconds: 1));
    print('DemoAController A onInit');
    super.onInit();
  }
}


class DemoBController extends GetxController {

  var count1 = 0.obs;
  var count2 = 0.obs;
  var count3 = 0.obs;

  @override
  void onInit() {
    print('DemoBController B onInit');
    super.onInit();
  }

}