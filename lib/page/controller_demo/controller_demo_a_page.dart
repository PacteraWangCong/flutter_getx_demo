import 'package:flutter/material.dart';
import 'package:fluttergetxdemo/controllers/demo_a_controller.dart';
import 'package:get/get.dart';
import 'controller_demo_b_page.dart';

class ControllerDemoAPage extends StatelessWidget {
  final bool global;

  const ControllerDemoAPage({Key key, this.global = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo A'),
      ),
      body: GetBuilder<DemoAController>(
        init: DemoAController(),
        global: global,
        initState: (state) {
          print('ControllerDemoAPage   initState');
        },
        builder: (controller) {
          return ListView(
            children: [
              Obx(() {
                return Text("A1: " + controller.count1.value.toString(), style: TextStyle(fontSize: 30));
              }),
              Obx(() {
                return Text("A2: " + controller.count2.value.toString(), style: TextStyle(fontSize: 30));
              }),
              Obx(() {
                return Text("A3: " + controller.count3.value.toString(), style: TextStyle(fontSize: 30));
              }),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                child: Text('add1'),
                onPressed: () {
                  controller.count1 += 1;
                },
              ),
              RaisedButton(
                child: Text('add2'),
                onPressed: () {
                  controller.count2 += 1;
                },
              ),
              RaisedButton(
                child: Text('add3'),
                onPressed: () {
                  controller.count3 += 1;
                },
              ),
              RaisedButton(
                child: Text(global ? 'push B' : 'push not global A'),
                onPressed: () {
                  if (global) {
                    navigator.push(MaterialPageRoute(builder: (context) {
                      return ControllerDemoBPage();
                    }));
                  } else {
                    navigator.push(MaterialPageRoute(builder: (context) {
                      return ControllerDemoAPage(global: false);
                    }));
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
