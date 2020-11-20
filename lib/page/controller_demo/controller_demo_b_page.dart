import 'package:flutter/material.dart';
import 'package:fluttergetxdemo/controllers/demo_a_controller.dart';
import 'package:fluttergetxdemo/controllers/demo_b_controller.dart';
import 'package:get/get.dart';

import 'controller_demo_a_page.dart';

class ControllerDemoBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final demoAController = Get.find<DemoAController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('demo B'),
      ),
      body: GetBuilder<DemoBController>(
        init: DemoBController(),
        initState: (state) {
          print('ControllerDemoBPage   initState');
        },
        builder: (controller) {
          return ListView(
            children: [
              Obx(() => Text("A1: " + demoAController.count1.toString(), style: TextStyle(fontSize: 30))),
              Obx(() => Text("A2: " + demoAController.count2.toString(), style: TextStyle(fontSize: 30))),
              Obx(() => Text("A3: " + demoAController.count3.toString(), style: TextStyle(fontSize: 30))),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text('add1 A'),
                onPressed: () {
                  demoAController.count1 += 1;
                },
              ),
              RaisedButton(
                child: Text('add2 A'),
                onPressed: () {
                  demoAController.count2 += 1;
                },
              ),
              RaisedButton(
                child: Text('add3 A'),
                onPressed: () {
                  demoAController.count3 += 1;
                },
              ),
              SizedBox(height: 50),
              Obx(() => Text("B1: " + controller.count1.toString(), style: TextStyle(fontSize: 30))),
              Obx(() => Text("B2: " + controller.count2.toString(), style: TextStyle(fontSize: 30))),
              Obx(() => Text("B3: " + controller.count3.toString(), style: TextStyle(fontSize: 30))),
              SizedBox(height: 50),
              RaisedButton(
                child: Text('add1 B'),
                onPressed: () {
                  controller.count1 += 1;
                },
              ),
              RaisedButton(
                child: Text('add2 B'),
                onPressed: () {
                  controller.count2 += 1;
                },
              ),
              RaisedButton(
                child: Text('add3 B'),
                onPressed: () {
                  controller.count3 += 1;
                },
              ),
              SizedBox(height: 30),
              RaisedButton(
                child: Text('push A'),
                onPressed: () {
                  navigator.push(MaterialPageRoute(builder: (context) {
                    return ControllerDemoAPage(global: true);
                  }));
                },
              )
            ],
          );
        },
      ),
    );
  }
}
