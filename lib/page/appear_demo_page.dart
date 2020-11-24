import 'package:flutter/material.dart';
import 'package:fluttergetxdemo/config/app_routes.dart';
import 'package:get/get.dart';
import 'package:fluttergetxdemo/extension/extension_widget.dart';

class AppearDemoAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      initState: (state) {
        context.didAppearCallBack(() {
          print('Appear Demo A  didAppear');
        });
      },
      dispose: (state) {
        context.disposeWorker();
      },
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text('Appear Demo A')),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Appear Demo A'),
                SizedBox(height: 60),
                RaisedButton(
                  child: Text('push Appear Demo B'),
                  onPressed: () {
                    AppRoutes.push(AppearDemoBPage());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AppearDemoBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      initState: (state) {
        context.didAppearCallBack(() {
          print('Appear Demo B  didAppear');
        });
      },
      dispose: (state) {
        context.disposeWorker();
      },
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text('Appear Demo B')),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Appear Demo B'),
                SizedBox(height: 60),
                RaisedButton(
                  child: Text('push Appear Demo C'),
                  onPressed: () {
                    AppRoutes.push(AppearDemoCPage());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AppearDemoCPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      initState: (state) {
        context.didAppearCallBack(() {
          print('Appear Demo C didAppear');
        });
      },
      dispose: (state) {
        context.disposeWorker();
      },
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text('Appear Demo C')),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Appear Demo C'),
                SizedBox(height: 60),
                RaisedButton(
                  child: Text('push Appear Demo D'),
                  onPressed: () {
                    AppRoutes.push(AppearDemoDPage());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AppearDemoDPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      initState: (state) {
        context.didAppearCallBack(() {
          print('Appear Demo D  didAppear');
        });
      },
      dispose: (state) {
        context.disposeWorker();
      },
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text('Appear Demo D')),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Appear Demo D'),
              ],
            ),
          ),
        );
      },
    );
  }
}
