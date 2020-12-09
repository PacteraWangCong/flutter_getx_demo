import 'package:flutter/material.dart';

class AccountDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('口座開設demo')),
      body: ListView(
        children: [AccountGroupView()],
      ),
    );
  }
}

class AccountGroupView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            color: Color(0xFFEFEFF4),
            height: 44,
            child: Row(
              children: [Text('お名前(漢字)')],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('姓'),
                SizedBox(height: 2),
                MFTextField(
                  controller: TextEditingController(),
                  labelText: '10文字まで  (例)銀行',
                  focusNode: FocusNode(),
                  checkAction: (value) {
                    if (value.isEmpty) {
                      return '入力してください';
                    }
                    if (value.length < 10) {
                      return '全角文字で入力してください';
                    }
                    return '';
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

typedef CheckAction<T> = String Function(T value);

enum TextFieldShowType { empty, error }

class MFTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final CheckAction<String> checkAction;
  final String labelText;

  const MFTextField({
    Key key,
    this.checkAction,
    this.controller,
    this.focusNode,
    this.labelText,
  }) : super(key: key);

  @override
  _MFTextFieldState createState() => _MFTextFieldState();
}

class _MFTextFieldState extends State<MFTextField> {
  FocusNode _focusNode;
  String _errorMsg = '';
  TextFieldShowType _showType = TextFieldShowType.empty;

  @override
  void dispose() {
    print('_MFTextFieldState  dispose');
    super.dispose();
  }

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_focusNodeListener);
    super.initState();
  }

  void _focusNodeListener() {
    if (_focusNode.hasFocus) {
      updateType(TextFieldShowType.empty);
    } else {
      // 焦点离开
      if (widget.checkAction != null) {
        _errorMsg = widget.checkAction(widget.controller.text);
      } else {
        _errorMsg = '';
      }
      if (_errorMsg != null && _errorMsg.isNotEmpty) {
        updateType(TextFieldShowType.error);
      } else {
        updateType(TextFieldShowType.empty);
      }
    }
  }

  /// 更新状态
  void updateType(TextFieldShowType type) {
    setState(() {
      _showType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        focusNode: _focusNode,
        controller: widget.controller ?? TextEditingController(),
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          labelText: widget.labelText,
          labelStyle: TextStyle(fontSize: 12),
          errorText: (_errorMsg.isEmpty || _showType == TextFieldShowType.empty) ? null : _errorMsg,
        ),
      ),
    );
  }
}
