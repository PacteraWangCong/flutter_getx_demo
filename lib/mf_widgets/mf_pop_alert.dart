import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MFPopAlert extends StatelessWidget {
  /// btn上部text,当child为null时有效
  String title;

  /// 中间message文言
  String description;

  /// btn上部text的style
  TextStyle titleStyle;

  /// btn上部text的align
  TextAlign titleAlign;

  /// 中间message文言的style
  TextStyle descriptionStyle;

  /// 中间message文言的align
  TextAlign descriptionAlign;

  /// btn上部自定义widget
  Widget child;

  /// 点击Ok alert是否消失，默认true
  final bool dismissWhenOkBtnAction;

  /// 点击Cancel alert是否消失，默认true
  final bool dismissWhenCancelBtnAction;

  /// ok按钮点击事件
  final VoidCallback okBtnAction;

  /// cancel按钮点击事件
  final VoidCallback cancelBtnAction;

  /// dialog 宽度
  final double width;

  /// alert距俩边的长度, 当设置[width]时无效
  final double bgWidthSpace;

  /// alert内部 padding
  final EdgeInsets contentInside;

  /// btn间距离
  final double btnSpace;

  /// 画面名用于GA计策
  final String screenName;

  final String okTitle;
  final String cancelTitle;
  final bool showOkBtnArrow;
  final bool showCancelBtnArrow;
  final double descriptionTopSpace;
  final double btnTopSpace;
  final double btnHeight;
  final double btnBorderRadius;
  final double bgBorderRadius;

  /// 内部只有一个Text的构造
  MFPopAlert.title(
    this.title, {
    this.width,
    this.screenName,
    this.titleStyle,
    this.titleAlign,
    this.description,
    this.descriptionStyle,
    this.descriptionAlign,
    this.okTitle = '',
    this.cancelTitle = '',
    this.showOkBtnArrow = false,
    this.showCancelBtnArrow = false,
    this.dismissWhenOkBtnAction = true,
    this.dismissWhenCancelBtnAction = true,
    this.okBtnAction,
    this.cancelBtnAction,
    this.descriptionTopSpace = 20,
    this.btnTopSpace = 0,
    this.btnHeight = 50.0,
    this.btnBorderRadius = 5.0,
    this.bgBorderRadius = 6.0,
    this.btnSpace = 0.5,
    this.bgWidthSpace = 30.0,
    this.contentInside = const EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 20),
  });

  /// 内部自定义Widget的构造
  MFPopAlert.child(
    this.child, {
    this.width,
    this.screenName,
    this.okTitle = '',
    this.cancelTitle = '',
    this.showOkBtnArrow = false,
    this.showCancelBtnArrow = false,
    this.dismissWhenOkBtnAction = true,
    this.dismissWhenCancelBtnAction = true,
    this.okBtnAction,
    this.cancelBtnAction,
    this.descriptionTopSpace = 20,
    this.btnTopSpace = 0,
    this.btnHeight = 50.0,
    this.btnBorderRadius = 5.0,
    this.bgBorderRadius = 6.0,
    this.btnSpace = 0.5,
    this.bgWidthSpace = 30.0,
    this.contentInside = const EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 15),
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Center(
        child: Container(
          width: (context.orientation == Orientation.landscape ? 320 : Get.width - bgWidthSpace * 2),
          decoration: BoxDecoration(
            color: Color(0xEDFFFFFF),
            borderRadius: BorderRadius.circular(bgBorderRadius),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: contentInside,
                child: child ??
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        child ??
                            Column(
                              children: <Widget>[
                                title != null
                                    ? Text(
                                        title,
                                        style: titleStyle ??
                                            TextStyle(
                                              fontSize: 16,
                                              color: Colors.red,
                                            ),
                                        strutStyle: StrutStyle(forceStrutHeight: true),
                                        textAlign: titleAlign ?? TextAlign.center,
                                      )
                                    : SizedBox(),
                                title != null ? SizedBox(height: descriptionTopSpace) : SizedBox(),
                                description != null
                                    ? Text(
                                        description,
                                        style: descriptionStyle ??
                                            TextStyle(
                                              fontSize: 14,
                                              decoration: TextDecoration.none,
                                            ),
                                        textAlign: descriptionAlign ?? TextAlign.center,
                                      )
                                    : SizedBox(height: 0)
                              ],
                            ),
                        description != null ? SizedBox(height: btnTopSpace) : SizedBox(),
                      ],
                    ),
              ),
              Container(color: Colors.grey, height: 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // cancel
                  cancelTitle != null
                      ? Expanded(
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Text(
                              cancelTitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                            onPressed: () {
                              if (dismissWhenCancelBtnAction && Navigator.of(context).canPop()) {
                                Navigator.of(context).pop();
                              }
                              if (cancelBtnAction != null) {
                                cancelBtnAction();
                              }
                            },
                          ),
                        )
                      : SizedBox(),
                  Container(
                    color: Colors.grey,
                    width: (cancelTitle != null && okTitle != null) ? btnSpace : 0,
                    height: 50,
                  ),
                  // ok
                  okTitle != null
                      ? Expanded(
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Text(
                              okTitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                            onPressed: () {
                              if (dismissWhenOkBtnAction && Navigator.of(context).canPop()) {
                                Navigator.of(context).pop();
                              }
                              if (okBtnAction != null) {
                                okBtnAction();
                              }
                            },
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
