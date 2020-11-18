import 'package:flutter/material.dart';
import 'package:fluttergetxdemo/controllers/demo_a_controller.dart';
import 'package:fluttergetxdemo/controllers/demo_b_controller.dart';
import 'package:get/get.dart';

class ControllerDemoBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final demoAController = Get.find<DemoAController>();
    final _controller = DemoBController();
    return Scaffold(
      appBar: AppBar(
        title: Text('demo B'),
      ),
      body: GetBuilder<DemoBController>(
        init: _controller,
        builder: (controller) {
          return ListView(
            children: [
              Obx(() => Text(demoAController.count1.toString(), style: TextStyle(fontSize: 30))),
              Obx(() => Text(demoAController.count2.toString(), style: TextStyle(fontSize: 30))),
              Obx(() => Text(demoAController.count3.toString(), style: TextStyle(fontSize: 30))),
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
              Obx(() => Text(controller.count1.toString(), style: TextStyle(fontSize: 30))),
              Obx(() => Text(controller.count2.toString(), style: TextStyle(fontSize: 30))),
              Obx(() => Text(controller.count3.toString(), style: TextStyle(fontSize: 30))),
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
                child: Text('push B'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return ControllerDemoBPage();
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
