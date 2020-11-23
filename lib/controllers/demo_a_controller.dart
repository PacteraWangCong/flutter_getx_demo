import 'package:get/get.dart';

class DemoAController extends GetxController {
  var count1 = 0.obs;
  var count2 = 0.obs;
  var count3 = 0.obs;

  @override
  void onInit() {
    ever(count1, (value) => print('count1  is -----$value'));
    print('DemoAController A onInit');
    super.onInit();
  }


  @override
  void onReady() {
    print('DemoAController A onReady');
    super.onReady();
  }


  @override
  // TODO: implement onStart
  get onStart => super.onStart;

}

/*
///每次`count1`变化时调用。
ever(count1, (_) => print("$_ has been changed"));

///只有在变量$_第一次被改变时才会被调用。
once(count1, (_) => print("$_ was changed once"));

///防DDos - 每当用户停止输入1秒时调用，例如.
debounce(count1, (_) => print("debouce$_"), time: Duration(seconds: 1));

///忽略1秒内的所有变化。
interval(count1, (_) => print("interval $_"), time: Duration(seconds: 1));
 */
