import 'package:flutter/material.dart';
import '../mf_widgets/mf_account_list_view.dart';
import '../mf_widgets/mf_account_text_field.dart';

class AccountDemoPage extends StatelessWidget {
  final controller = MFAccountListController();

  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('口座開設demo')),
      backgroundColor: Color(0xFFE1E1E1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MFAccountListView(
            controller: controller,
            children: [
              AccountGroupHeader(title: '33'),
              MFAccountTextField(
                controller: textController1,
                node: CheckFocusNode(),
                title: '11',
                labelText: '11',
                checkAction: (value) {
                  if (value.isEmpty) {
                    return '入力してください';
                  }
                  if (value.length < 10) {
                    return '全角文字で入力してください';
                  }
                  return '';
                },
              ),
              AccountGroupHeader(title: '33'),
              MFAccountTextField(
                controller: textController2,
                node: CheckFocusNode(),
                title: '22',
                labelText: '22',
                checkAction: (value) {
                  if (value.isEmpty) {
                    return '入力してください';
                  }
                  if (value.length < 10) {
                    return '全角文字で入力してください';
                  }
                  return '';
                },
              ),
              AccountGroupHeader(title: '33'),
              MFAccountTextField(
                controller: textController3,
                node: CheckFocusNode(),
                title: '33',
                labelText: '33',
                checkAction: (value) {
                  if (value.isEmpty) {
                    return '入力してください';
                  }
                  if (value.length < 10) {
                    return '全角文字で入力してください';
                  }
                  return '';
                },
              ),
              RaisedButton(
                color: Colors.white,
                child: Text('jump to page'),
                onPressed: () {
                  controller.checkAll();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AccountGroupHeader extends StatelessWidget {
  final String title;
  final bool isMust;

  const AccountGroupHeader({
    Key key,
    this.title = '',
    this.isMust = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 2, right: 2),
      child: Container(
        color: Color(0xFFF0F0F0),
        height: 50,
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
              child: Text(
                '必須',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
