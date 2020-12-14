import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef CheckAction<T> = String Function(T value);

enum TextFieldShowType { empty, error }

class MFInputTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final CheckAction<String> checkAction;
  final String labelText;

  const MFInputTextField({
    Key key,
    this.checkAction,
    this.controller,
    this.focusNode,
    this.labelText,
  }) : super(key: key);

  @override
  _MFInputTextFieldState createState() => _MFInputTextFieldState();
}

class _MFInputTextFieldState extends State<MFInputTextField> {
  FocusNode _focusNode;
  String _errorMsg = '';
  TextFieldShowType _showType = TextFieldShowType.empty;

  @override
  void dispose() {
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
    return TextField(
      focusNode: _focusNode,
      controller: widget.controller ?? TextEditingController(),
      style: TextStyle(fontSize: 18),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        labelText: widget.labelText,
        labelStyle: TextStyle(fontSize: 12),
        errorText: (_errorMsg.isEmpty || _showType == TextFieldShowType.empty) ? null : _errorMsg,
      ),
    );
  }
}
