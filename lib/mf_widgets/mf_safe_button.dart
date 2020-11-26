import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 防连点button
class MFSafeButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double minSize;
  final EdgeInsetsGeometry padding;
  final Duration time;

  const MFSafeButton({
    Key key,
    this.child,
    this.onPressed,
    this.minSize = 0,
    this.padding = EdgeInsets.zero,
    this.time = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool canClicked = true;
    return CupertinoButton(
      padding: padding,
      minSize: minSize,
      child: child,
      onPressed: () {
        if (canClicked && onPressed != null) {
          canClicked = false;
          Future.delayed(time, () {
            canClicked = true;
          });
          onPressed();
        }
      },
    );
  }
}
