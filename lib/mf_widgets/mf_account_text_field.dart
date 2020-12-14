import 'package:flutter/material.dart';
import 'mf_input_text_field.dart';
import 'mf_account_list_view.dart';

class MFAccountTextField extends StatefulWidget with MFAccountCheck {
  final String title;
  final String labelText;
  final CheckAction<String> checkAction;
  final TextEditingController controller;
  final CheckFocusNode node;
  final Widget infoChild;
  final EdgeInsets padding;

  const MFAccountTextField({
    Key key,
    this.title,
    this.checkAction,
    this.node,
    this.controller,
    this.labelText,
    this.infoChild,
    this.padding = const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
  }) : super(key: key);

  @override
  _MFAccountTextFieldState createState() => _MFAccountTextFieldState();

  @override
  String check() {
    if (checkAction != null) {
      node?.changeNotify();
      return checkAction(controller?.text ?? '');
    }
    return '';
  }
}

class _MFAccountTextFieldState extends State<MFAccountTextField> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.white,
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != null ? Text(widget.title) : SizedBox(),
          widget.infoChild ?? SizedBox(),
          MFInputTextField(
            controller: widget.controller ?? TextEditingController(),
            labelText: widget.labelText,
            focusNode: widget.node ?? FocusNode(),
            checkAction: (value) {
              if (widget.checkAction != null) {
                return widget.checkAction(value);
              }
              return '';
            },
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

/// 自定义包裹notifyListeners方法，消除直接使用的警告
class CheckFocusNode extends FocusNode {
  void changeNotify() {
    notifyListeners();
  }
}
