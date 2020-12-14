import 'package:flutter/material.dart';
import '../mf_widgets/mf_account_list_view.dart';
import '../mf_widgets/mf_account_text_field.dart';
import '../mf_widgets/mf_account_name_view.dart';

class AccountDemoPage extends StatelessWidget {
  final controller = MFAccountListController();

  final lastNameTC = TextEditingController();
  final firstNameTC = TextEditingController();

  final kanaLastNameTC = TextEditingController();
  final kanaFirstNameTC = TextEditingController();

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
              AccountGroupHeader(title: 'お名前(漢字)'),
              MFAccountNameView(
                title1: '姓',
                title2: '名',
                labelText1: '10文字まで  (例)銀行',
                labelText2: '10文字まで  (例)太郎',
                controller1: lastNameTC,
                controller2: firstNameTC,
                node1: CheckFocusNode(),
                node2: CheckFocusNode(),
                checkAction1: (value) {
                  return value.isEmpty ? '入力してください' : '';
                },
                checkAction2: (value) {
                  return value.isEmpty ? '入力してください' : '';
                },
              ),
              AccountGroupHeader(title: 'お名前(フリガナ)'),
              MFAccountNameView(
                title1: 'セイ',
                title2: 'メイ',
                labelText1: '20文字まで  (例)ギンコウ',
                labelText2: '20文字まで  (例)タロウ',
                controller1: kanaLastNameTC,
                controller2: kanaFirstNameTC,
                node1: CheckFocusNode(),
                node2: CheckFocusNode(),
                checkAction1: (value) {
                  return value.isEmpty ? '入力してください' : '';
                },
                checkAction2: (value) {
                  return value.isEmpty ? '入力してください' : '';
                },
              ),
              AccountGroupHeader(title: '11'),
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
              AccountGroupHeader(title: '22'),
              MFAccountTextField(
                controller: textController2,
                node: CheckFocusNode(),
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
                  if (controller.checkAll()) {
                    print('check ok');
                  } else {
                    print('check ng');
                  }
                },
              ),
              SizedBox(height: 20)
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
