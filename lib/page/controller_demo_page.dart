import 'package:flutter/material.dart';
import 'package:fluttergetxdemo/config/app_routes.dart';
import 'package:fluttergetxdemo/controllers/controller_demo_controller.dart';
import 'package:fluttergetxdemo/page/home_page.dart';
import 'package:get/get.dart';

class ControllerDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('controller demo')),
      body: ListView(
        children: [
          HomeBtn(
            title: 'controller global',
            description: '//演示一个作用全局的controller',
            clickedAction: () {
              AppRoutes.push(ControllerDemoAPage(global: true));
            },
          ),
          HomeBtn(
            title: 'controller not global',
            description: '//演示一个作用非全局的controller',
            clickedAction: () {
              AppRoutes.push(ControllerDemoAPage(global: false));
            },
          ),
        ],
      ),
    );
  }
}

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
          print('ControllerDemoAPage  GetBuilder initState');
        },
        dispose: (state) {
          print('ControllerDemoAPage  GetBuilder dispose');
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
                    AppRoutes.push(ControllerDemoBPage());
                  } else {
                    AppRoutes.push(ControllerDemoAPage(global: false));
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
        dispose: (state) {
          print('ControllerDemoBPage  GetBuilder dispose');
        },
        initState: (state) {
          print('ControllerDemoBPage  GetBuilder initState');
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
                  AppRoutes.push(ControllerDemoAPage(global: true));
                },
              )
            ],
          );
        },
      ),
    );
  }
}
