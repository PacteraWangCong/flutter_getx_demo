import 'package:flutter/material.dart';
import 'mf_account_list_view.dart';
import 'mf_account_text_field.dart';

class MFAccountNameView extends StatefulWidget with MFAccountCheck {
  final Widget infoChild;

  /// part 1
  final String title1;
  final String labelText1;
  final CheckAction<String> checkAction1;
  final TextEditingController controller1;
  final CheckFocusNode node1;

  /// part2
  final String title2;
  final String labelText2;
  final CheckAction<String> checkAction2;
  final TextEditingController controller2;
  final CheckFocusNode node2;

  const MFAccountNameView({
    Key key,
    this.title1,
    this.labelText1,
    this.checkAction1,
    this.controller1,
    this.node1,
    this.title2,
    this.labelText2,
    this.checkAction2,
    this.controller2,
    this.node2,
    this.infoChild,
  }) : super(key: key);

  @override
  _MFAccountNameViewState createState() => _MFAccountNameViewState();

  @override
  bool check() {
    String error1, error2 = '';
    if (checkAction1 != null) {
      node1?.changeNotify();
      error1 = checkAction1(controller1?.text ?? '');
    }
    if (checkAction2 != null) {
      node2?.changeNotify();
      error2 = checkAction2(controller2?.text ?? '');
    }
    return error1.isEmpty && error2.isEmpty;
  }
}

class _MFAccountNameViewState extends State<MFAccountNameView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(widget.title1 ?? ''),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(widget.title2 ?? ''),
              )
            ],
          ),
          SizedBox(height: 6),
          widget.infoChild ?? SizedBox(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MFAccountTextField(
                  padding: EdgeInsets.zero,
                  controller: widget.controller1,
                  node: widget.node1,
                  labelText: widget.labelText1,
                  checkAction: widget.checkAction1,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: MFAccountTextField(
                  padding: EdgeInsets.zero,
                  controller: widget.controller2,
                  node: widget.node2,
                  labelText: widget.labelText2,
                  checkAction: widget.checkAction2,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
